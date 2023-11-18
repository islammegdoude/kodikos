import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kodikos/layout/AppLayout.dart';
import 'package:kodikos/modules/login/cubit/loginStates.dart';
import 'package:kodikos/modules/register/RegisterEmployee.dart';
import 'package:kodikos/modules/welcom/WelcomPage.dart';
import 'package:kodikos/shared/components/components.dart';
import 'package:kodikos/shared/components/constants.dart';
import 'package:kodikos/shared/network/local/cashe_helper.dart';

import '../../shared/cubit/cubit.dart';
import '../welcom/WelcomPageTow.dart';
import 'cubit/loginCubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if (state is LoginSuccesState) {
              CachHelper.saveData(
              key: 'token',
              value: state.loginModel!.data[0].token,
            ).then((value) {
              notification(
                message: 'Login Succesfully',
                state: ToastStates.SUCCESS,
              );
              AppCubit.get(context).getAllJobs();
              navigateAndFinish(context, const AppLayout());
            });
          if (state.loginModel!.status == "successful") {
            
          }
          
        }
        if (state is LoginErrorState) {
          notification(
            message: 'something went wrong',
            state: ToastStates.ERROR,
          );
        }
          },
          builder: (context, state) => Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: Image.asset(
                  'assets/images/be2.png',
                  height: 200,
                  width: 200,
                )),
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email must not be empty";
                    }
                  },
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password must not be empty";
                    }
                  },
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
                        //navigateTo(context, .ForgotPassWordScreen);
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
                ConditionalBuilder(
                  condition: state is! LoginLoadingState,
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  builder: (context) => kdefultButtom(
                    title: 'Login',
                    borderColor: primaryColor,
                    width: double.infinity,
                    height: 50,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passWordController.text);
                        LoginCubit.get(context).userLogin(
                          email: emailController.text,
                          password: passWordController.text,
                        );
                        // navigateAndFinish(context, AppLayout());
                      }
                    },
                  ),
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
                        navigateTo(context, RegisterEmployeeScreen());
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
        ),
      ),
    ));
  }
}
