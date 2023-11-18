import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kodikos/modules/login/LoginScreen.dart';
import 'package:kodikos/modules/welcom/WelcomPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cashe_helper.dart';
import '../../shared/styles/colors.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({required this.image, required this.body, required this.title});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/photo_5962807924759838441_y.jpg',
        title: 'Easy',
        body: '''we make easy by our simple and efective interfice and featurs.'''),
    BoardingModel(
        image: 'assets/images/undraw_Interview_re_e5jn.png',
        title: 'Fast',
        body: '''and that is back to our data base and community so can have access to the largest number of companys '''),
    BoardingModel(
        image: 'assets/images/undraw_Post_re_mtr4.png',
        title: 'best',
        body:  '''your chances to having interviews and geting your deam job will be better then ever '''),
  ];

  var boardingController = PageController(
    initialPage: 0,
  );

  bool isLast = false;
  void submit() {
    CachHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
            ),
            onPressed: () {
              submit();
            },
            child: const Text(
              'Skip',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 30.0, end: 30.0, top: 30.0, bottom: 20.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardingController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardingController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    dotColor: Colors.grey,
                    activeDotColor: primaryColor,
                    expansionFactor: 4.0,
                    spacing: 5.0,
                  ),
                ),
                const Spacer(),
                // FloatingActionButton(
                //   backgroundColor: primaryColor,
                //   onPressed: () {
                //     if (isLast == true) {
                //       submit();
                //     } else {
                //       boardingController.nextPage(
                //           duration: const Duration(milliseconds: 750),
                //           curve: Curves.fastLinearToSlowEaseIn);
                //     }
                //   },
                //   child: const Icon(Icons.arrow_forward_ios_rounded),
                // ),
                kdefultButtom(title: 'Next', borderColor: primaryColor, width: 120 , height: 48, onPressed: (){
                  if (isLast == true) {
                    submit();
                  } else {
                    boardingController.nextPage(
                        duration: const Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                })
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image(
              image: AssetImage(
                model.image,
              ),
              height: 300.0,
              width: 300.0,
            ),
          ),
          const SizedBox(height: 30.0),
          Text(
            model.title,
            style: const TextStyle(fontSize: 26.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 15.0),
          Text(
            model.body,
            maxLines: 2,
            overflow: TextOverflow.visible,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      );
}
