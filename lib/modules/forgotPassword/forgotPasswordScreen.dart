// import 'package:flutter/material.dart';

// import '../../shared/components/components.dart';
// import '../login/LoginScreen.dart';

// class ForgotPassWordScreen extends StatelessWidget {
//   ForgotPassWordScreen({super.key});
//   TextEditingController emailController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
    
//     return SafeArea(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Scaffold(
//           body: Padding(
//             padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   // app bar
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(),
//                       Image.asset(
//                         'assets/images/logo.png',
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           navigateAndFinish(context, LoginScreen());
//                         },
//                         icon: const Icon(
//                           Icons.arrow_forward_ios,
//                           size: 30,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 40),
//                   const Text(
//                     'لإسترجاع كلمة السر يرجى إدخال بريدك الإلكتروني',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
                    
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600
//                     ),
//                   ),
//                   const SizedBox(height: 30,),
//                   defultFormField(
//                     controller: emailController,
//                     keyboardType: TextInputType.text,
//                     textlabel: 'البريد الإلكتروني',
//                     prefixIcon: Icons.email_outlined,
//                     onChanged: (value) {},
//                   ),
//                   const SizedBox(height: 70,),
//                   BlocConsumer<LoginCubit,LoginStates>(
//                     listener: (context, state) {
//                       if(state is ShopSuccessRecoverPasswordState){
//                         notification(
//                           message: 'تم إرسال الكود بنجاح',
//                           state: ToastStates.SUCCESS,
//                         );
//                         navigateTo(context, SendCodeScreen(emailController.text));
//                       }
//                       if(state is ShopErrorRecoverPasswordState){
//                         notification(
//                           message: 'حدث خطأ ما',
//                           state: ToastStates.ERROR,
//                         );
//                       }
//                     },
//                     builder: (context, state) => ConditionalBuilder(
//                       condition: state is! ShopLoadingRecoverPasswordState,
//                       fallback: (context) => const Center(child: CircularProgressIndicator()),
//                       builder: (context) => ElevatedButton(
//                         onPressed: (){
//                           if (_formKey.currentState!.validate()) {
//                           LoginCubit.get(context).recoverPassword(emailController.text);
//                           print('done');
//                         }
                          
//                         }, 
//                         child: const Text(
//                           'إرسال',
//                           style: TextStyle(fontSize: 20,color: Colors.white),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: secondColor,
//                           minimumSize: const Size(double.infinity, 50),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }