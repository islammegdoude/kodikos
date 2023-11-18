import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kodikos/layout/AppLayout.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';
import '../home/homeScreen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Search',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                      onPressed: () {
                        // AppCubit.get(context).getAllProducts();
                        // AppCubit.get(context).getAllCategories();
                        navigateAndFinish(context, const AppLayout());
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                defultFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  textlabel: 'Search',
                  prefixIcon: Icons.search,
                  onChanged: (value) {
                    AppCubit.get(context).search(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: BlocConsumer<AppCubit, AppStates>(
                      listener: (context, state) {
                        
                      },
                      builder: (context, state) {
                        return ConditionalBuilder(
                          condition: state is! AppLoadingSearchState, 
                          fallback: (context) => const Center(child: CircularProgressIndicator(),),
                          builder: (context) {
                            return AppCubit.get(context).searchModel != null &&
                              AppCubit.get(context)
                                  .searchModel!
                                  .data
                                  .isNotEmpty
                          ? Container(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  end: 8.0,
                                  start: 8.0,
                                  top: 8.0,
                                  bottom: 8.0,
                                ),
                                child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => jobItemBuilder(context,AppCubit.get(context).searchModel!.data[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: AppCubit.get(context).searchModel!.data.length,
                      )
                              ),
                            )
                          : const Center(
                              child: Text(
                                '',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w600),
                              ),
                            ); 
                          }, 
                        );
                      }, 
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}