import 'package:flutter/material.dart';
import 'package:kodikos/modules/welcom/WelcomPageTow.dart';
import 'package:kodikos/shared/components/components.dart';
import 'package:kodikos/shared/components/constants.dart';
import 'package:kodikos/shared/network/local/cashe_helper.dart';


import '../register/RegisterEmployee.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset('assets/images/be2.png',height: 200,width: 200,)),
              const Text(
                "what are you !!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                "define your acount type",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              kdefultButtom(
                title: 'company',
                borderColor: const Color(0xff121212),
                width: double.infinity,
                height: 50,
                onPressed: () {
                  // CachHelper.saveData(key: 'Type', value: 'company')
                  //     .then((value) {
                  //   if (value) {
                  //     navigateAndFinish(context, WelcomPageTow());
                  //   }
                  // });
                  //navigateTo(context, RegisterCompanyScreen());
                },
              ),
              SizedBox(
                height: 20,
              ),
              kdefultButtom(
                title: 'employee',
                borderColor: primaryColor,
                width: double.infinity,
                height: 50,
                onPressed: () {
                  // CachHelper.saveData(key: 'Type', value: 'employee')
                  //     .then((value) {
                  //   if (value) {
                  //     navigateAndFinish(context, WelcomPageTow());
                  //   }
                  // });
                  navigateTo(context, RegisterEmployeeScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
