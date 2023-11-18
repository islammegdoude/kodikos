import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kodikos/layout/AppLayout.dart';
import 'package:kodikos/shared/components/constants.dart';
import 'package:kodikos/shared/cubit/cubit.dart';
import 'package:kodikos/shared/cubit/states.dart';

import '../../models/jobModel.dart';
import '../../shared/components/components.dart';

class JobDetails extends StatefulWidget {
  final JobOfferData? model;
  JobDetails({Key? key, @required this.model}) : super(key: key);
  
  @override
  State<JobDetails> createState() => _JobDetailsState(model: model);
}

class _JobDetailsState extends State<JobDetails> {
  final JobOfferData? model;
  _JobDetailsState({@required this.model});
  PageController pageController = PageController(initialPage: 0);
  Color? isClicked = const Color.fromARGB(255, 8, 24, 42);
  Color? noClicked = const Color.fromARGB(255, 8, 39, 70);
  Color? isClickedColor = Colors.blue;
  Color? noClickedColor = Colors.white;
  int pagechanged = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            right: 25,
            left: 25,
          ),
          child: Column(
            children: [
              // App Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // button to back
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
                      onPressed: () {
                        navigateTo(context, AppLayout());
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          ),
                    ),
                  ),
                  // title page : Job Detail
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Job Detail',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              // job title and like button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // icon of company
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(255, 8, 39, 70),
                    ),
                    child: Image.asset(
                      'assets/images/twitter.png',
                      height: 50,
                      width: 50,
                    ),
                  ),
                  // job title and name of company
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // company name
                        Text(
                          'Twitter Algeria',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        // job name
                        Text(
                          "${widget.model?.titleJobOffer}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              // place of company
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.place_outlined,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
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
                  Row(
                    children: const [
                      Icon(
                        Icons.touch_app_outlined,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '300 Applicats',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.attach_money_rounded,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '\$500-\$1k / Month',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 40,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Ui/Ux',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 20,
                        width: 50,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Remote',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // tab bar
              Container(
                height: 60,
                padding: EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(255, 8, 39, 70),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Description details bUtton
                    Expanded(
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: pagechanged == 0 ? isClicked : noClicked,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (pagechanged == 1) {
                              pageController.animateToPage(
                                0,
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                                curve: Curves.bounceInOut,
                              );
                            }
                          },
                          child: Text(
                            'Description',
                            style: TextStyle(
                              color: pagechanged == 0
                                  ? isClickedColor
                                  : noClickedColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Company details bUtton
                    Expanded(
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: pagechanged == 1 ? isClicked : noClicked,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (pagechanged == 0) {
                              pageController.animateToPage(
                                1,
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                                curve: Curves.bounceInOut,
                              );
                            }
                          },
                          child: Text(
                            'Company',
                            style: TextStyle(
                              color: pagechanged == 1
                                  ? isClickedColor
                                  : noClickedColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // page view of the tab bar
              Expanded(
                flex: 1,
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  pageSnapping: true,
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      pagechanged = index;
                    });
                  },
                  children: [
                    companyDetails(),
                    companyDetails(),
                  ],
                ),
              ),
              
              Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Confirmation'),
                              content:
                                  const Text('Are you sure you want to apply?'),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BlocConsumer<AppCubit,AppStates>(
                                      listener: (context, state) {
                                        if(state is AppSuccessApplyJobState){
                                          notification(message: "Applied successfully", state: ToastStates.SUCCESS);
                                          navigateAndFinish(context, AppLayout());
                                        }
                                      },
                                      builder: (context, state) => ConditionalBuilder(
                                        condition: state is! AppLoadingApplyJobState,
                                        fallback: (context) => const Center(child: CircularProgressIndicator(),),
                                        builder: (context) => TextButton(
                                          onPressed: () {
                                            AppCubit.get(context).applyJob(model!.idJobOffer,);
                                          },
                                          child: const Text("Yes",
                                              style: TextStyle(fontSize: 18)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(
                                            context);
                                        },
                                        child:  Text("No",
                                            style: TextStyle(fontSize: 18)),
                                      ),
                                  ],
                                ),
                              ],
                            );
                          },
                        );
                  },
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }

  Widget companyDetails() {
    return Container(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 8,
        right: 8,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Twitter Algeria is a solution for seafood addicts! We strive to express a positive impression and are committed to producing only good quality without preservatives food products.',
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/web.png',
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    'Website',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    'elmegdoude.com',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/apartment 1.png',
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    'Industry',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    'Socialmedia',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/icons/user folder.png',
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    'Company size',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Text(
                    '1-50 employee',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Office address',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Jl. 5 july  T No. 8 Elord MEGDOUDE, RT.22/RW.17, North algeria, M\'sila , Hammam Dalaa city 14440',
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}