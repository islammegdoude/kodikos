import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/login/cubit/loginCubit.dart';
import 'modules/slash/splashScreen.dart';
import 'shared/BlocObserver.dart';
import 'shared/components/constants.dart';
import 'shared/cubit/cubit.dart';
import 'shared/network/local/cashe_helper.dart';
import 'shared/network/remot/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  
  DioHelper.init();
  await CachHelper.inite();
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
    

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AppCubit()..getAllJobs(),),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Kodikos',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          primaryColor: primaryColor,
          useMaterial3: true,
          fontFamily: "Poppins" 
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
