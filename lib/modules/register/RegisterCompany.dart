import 'package:flutter/material.dart';
import 'package:kodikos/shared/components/components.dart';
import 'package:kodikos/shared/components/constants.dart';

import '../login/LoginScreen.dart';

class RegisterCompanyScreen extends StatelessWidget {
  RegisterCompanyScreen({super.key});
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController companyTypeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24,right: 24,top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Create new company account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Full name",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: fullNameController,
                decoration: const InputDecoration(
                  hintText: "Enter your full name",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
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
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Enter your password",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Confirm Password",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  hintText: "Confirm your password",
                ),
              ),
              SizedBox(
                height: 40,
              ),
              // register btn 
              kdefultButtom(
                title: 'Register', 
                borderColor: primaryColor, 
                width: double.infinity,
                height: 55, 
                onPressed: (){

                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      navigateAndFinish(context, LoginScreen());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}





// const SizedBox(
              //   height: 20,
              // ),
              // const Text(
              //   "Phone Number",
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // TextFormField(
              //   keyboardType: TextInputType.phone,
              //   controller: phoneNumberController,
              //   decoration: const InputDecoration(
              //     hintText: "Enter your phone number",
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // const Text(
              //   "Company Type",
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              // TextFormField(
              //   keyboardType: TextInputType.text,
              //   controller: companyTypeController,
              //   decoration: const InputDecoration(
              //     hintText: "Enter your company type",
              //   ),
              // ),