import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cashe_helper.dart';
import '../login/LoginScreen.dart';
import 'WelcomPage.dart';

class WelcomPageTow extends StatelessWidget {
  const WelcomPageTow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24,right: 24,bottom: 50), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.only(top: 20, ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      navigateAndFinish(context, WelcomPage());
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                "what are you !!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "define your acount type",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            kdefultButtom(
                title: 'Login',
                borderColor: const Color(0xff121212),
                width: double.infinity,
                height: 50,
                onPressed: () {
                  navigateAndFinish(context, LoginScreen());
                },
              ),
              SizedBox(
                height: 20,
              ),
              kdefultButtom(
                title: 'Register',
                borderColor: primaryColor,
                width: double.infinity,
                height: 50,
                onPressed: () {
                  CachHelper.getData(key: 'Type').then((value) {
                    if (value == 'company' || value == 'employee') {
                      navigateAndFinish(context, WelcomPageTow());
                    } else {
                      navigateAndFinish(context, WelcomPageTow());
                    }
                  });
                  
                },
              ),
          ],
        ),
      ),
    );
  }
}