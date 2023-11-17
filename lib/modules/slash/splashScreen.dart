import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kodikos/modules/login/LoginScreen.dart';

import '../../layout/AppLayout.dart';
import '../../shared/components/components.dart';
import '../../shared/network/local/cashe_helper.dart';
import '../onboarding/OnBoardingScreen.dart';
import '../welcom/WelcomPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), ()async {
      bool? onBoarding = CachHelper.getBoolData(key: 'onBoarding');
      String? token = CachHelper.getStringData(key: 'token');

  Widget startWidget = const OnBoardingScreen();
  if (onBoarding == true) {
    if (token != null) {
      startWidget = AppLayout();
    }else{
      startWidget = LoginScreen();
    }
  } else {
    startWidget = const OnBoardingScreen();
  }
      Navigator.pushReplacement(context,
       MaterialPageRoute(
          builder: (context) => OnBoardingScreen(), // Replace with your home screen
        ),
      );
  });
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/be22.png',height: 300,width: 300,),
                
                const Text(
                  'Welcome to our store',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
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