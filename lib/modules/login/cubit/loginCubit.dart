import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/loginModel.dart';
import '../../../shared/network/end-points/endPoints.dart';
import '../../../shared/network/remot/dio_helper.dart';
import 'loginStates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(): super(LoginInitialState());
  
  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel ;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccesState(loginModel));
      //emit(LoginSuccesState());
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
  
  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  void changeVisibility(bool isShow) {
    isPassword = !isPassword;
    isPassword
        ? suffix = Icons.visibility_off_outlined
        : suffix = Icons.remove_red_eye_outlined;
    emit(LoginPassWordIsShow());
  }

    ////// recovre password ///////
  
  void recoverPassword(String email) {
    emit(ShopLoadingRecoverPasswordState());
    DioHelper.postData(
      url: RECOVER_PASSWORD,
      data: {
        'email': email,
      },
    ).then((value) {
      print(value.data);
      emit(ShopSuccessRecoverPasswordState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorRecoverPasswordState());
    });
  }

  /////// change password ///////
  void changePassword(String email , String code, String password) {
    print(email);
    print(code);
    print(password);
    emit(ShopLoadingChangePasswordState());
    //email, code, password, confirmedPassword
    DioHelper.postData(
      url: PUT_CHANGE_PASSWORD,
      data: {
        'email': email,
        'code' : int.tryParse(code),
        'password': password,
        'confirmedPassword': password
      },
    ).then((value) {
      print(value.data);
      emit(ShopSuccessChangePasswordState(changePasswordResponse: value.data['message']));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorChangePasswordState());
    });
  }
}
