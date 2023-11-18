import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kodikos/shared/components/constants.dart';
import 'package:kodikos/shared/cubit/cubit.dart';
import 'package:kodikos/shared/cubit/states.dart';

import '../../models/jobModel.dart';
import '../../shared/components/components.dart';
import '../search/searchScreen.dart';
import 'jobDetails.dart';

class Category {
  String image;
  String title;
  Category({required this.image, required this.title});
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<Category> category = [
    Category(image: 'assets/icons/remote.png', title: 'Remote'),
    Category(image: 'assets/icons/freelance.png', title: 'Freelance'),
    Category(image: 'assets/icons/fulltime.png', title: 'FullTime'),
    Category(image: 'assets/icons/internship.png', title: 'Internship'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                right: 25,
                left: 25,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // text : hello islam
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello Islam',
                              style: TextStyle(
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Find your dream job',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        // notification button
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    /////// search bar ///////
                    InkWell(
                      onTap: () {
                        // cubit.searchModel = null;
                        navigateTo(context, SearchScreen());
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 1, color: Colors.black),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: 28,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Search',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    // top Job sugettion
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Top Job in December',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                const Text(
                                  'Flutter devloppement',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                // read me botton
                                Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.blue),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Read Me',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/findAjob.png',
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // browse by category
                    const Text(
                      'Browse By Category',
                      style: TextStyle(
                        letterSpacing: 1.5,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // categories list
                    Container(
                      width: double.infinity,
                      height: 90,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            catygoryItem(category[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 32.0,
                        ),
                        itemCount: category.length,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // New Jobs and (see more) as text button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'New Jobs',
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1.5,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See more',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // New Jobs
                    ConditionalBuilder(
                      condition: state is! AppLoadingGetJobsState,
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      builder: (context) => cubit.jobOfferResponse != null &&
                                            cubit.jobOfferResponse!.data.isNotEmpty  ? ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => jobItemBuilder(context,cubit.jobOfferResponse!.data[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: cubit.jobOfferResponse!.data.length,
                      ): Text('No Jobs Found'),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container catygoryItem(Category model) {
    return Container(
      width: 60,
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color.fromARGB(255, 115, 115, 115),
                  width: 0.5,
                ),
                //color: const Color.fromARGB(255, 8, 39, 70),
                color: Colors.white),
            child: MaterialButton(
              onPressed: () {},
              child: Image.asset(
                model.image,
                height: 32,
                width: 32,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            model.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

InkWell jobItemBuilder(context,JobOfferData model) {
  return InkWell(
    onTap: () {
      navigateTo(context, JobDetails(model: model,));
    },
    child: Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromARGB(255, 115, 115, 115),
          width: 0.5,
        ),
      ),
      child: Column(
        children: [
          // job title and like button
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // icon of company
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromARGB(255, 8, 39, 70),
                  ),
                  child: Image.asset(
                    'assets/images/twitter.png',
                    height: 32,
                    width: 32,
                  ),
                ),
                // job title and name of company
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      // company name
                      const Text(
                        'Twitter',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      // job name
                      Text(
                        model.titleJobOffer,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // // favorite icon
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.favorite,
                //     color: Colors.red,
                //     size: 27,
                //   ),
                // ),
              ],
            ),
          ),
          // place of company
          const Row(
            children: [
              Icon(
                Icons.place_outlined,
                size: 14,
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                'Msila Hammam Dalaa',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          // how much earn in this job
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.attach_money_rounded,
                    size: 14,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    '500 - 1k / Month ',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text(
                '2 hours ago',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
