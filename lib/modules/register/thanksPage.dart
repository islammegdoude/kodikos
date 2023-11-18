import 'package:flutter/material.dart';
import 'package:kodikos/shared/components/components.dart';
import 'package:kodikos/shared/components/constants.dart';

import '../login/LoginScreen.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,  
          children: [
            Image.asset('assets/images/be22.png',height: 300,width: 300,),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'CONGRATULATION',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Now you can login to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            kdefultButtom(
              title: "Login", 
              borderColor: primaryColor, 
              width: double.infinity, 
              height: 55, 
              onPressed: (){
                navigateTo(context, LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}