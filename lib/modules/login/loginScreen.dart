import 'package:flutter/material.dart';
import 'package:kodikos/modules/welcom/WelcomPage.dart';
import 'package:kodikos/shared/components/components.dart';
import 'package:kodikos/shared/components/constants.dart';
import 'package:kodikos/shared/network/local/cashe_helper.dart';

import '../welcom/WelcomPageTow.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //app bar
            // Padding(
            //   padding: const EdgeInsets.only(top: 20, ),
            //   child: Row(
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           navigateAndFinish(context, WelcomPageTow());
            //         },
            //         icon: const Icon(
            //           Icons.arrow_back_ios,
            //           size: 30,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Center(child: Image.asset('assets/images/be2.png',height: 200,width: 200,)),
            
            const Text(
              "Email",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Enter your email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Password",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextFormField(
              controller: passWordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Enter your password",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  "Forget Password?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //navigateTo(context, ForgotPassWordScreen);
                  },
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            kdefultButtom(
              title: 'Login',
              borderColor: primaryColor,
              width: double.infinity,
              height: 50,
              onPressed: () {},
            ),
            Row(
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // CachHelper.getData(key: 'Type').then((value) {
                    //   if (value == 'company') {
                    //     // write code here
                    //   } else {
                    //     // write code here
                    //   }
                    // });
                    navigateTo(context, WelcomPage());
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
