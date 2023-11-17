//import '../../../models/loginModel.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccesState extends LoginStates {
  //LoginModel loginModel;

  // LoginSuccesState(this.loginModel);
  LoginSuccesState();
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}
class LoginPassWordIsShow extends LoginStates {}




////// recover password ////////

class ShopLoadingRecoverPasswordState extends LoginStates {}

class ShopSuccessRecoverPasswordState extends LoginStates {
  
  
  ShopSuccessRecoverPasswordState();
}

class ShopErrorRecoverPasswordState extends LoginStates {}

////// change password ////////

class ShopLoadingChangePasswordState extends LoginStates {}

class ShopSuccessChangePasswordState extends LoginStates {
  final String changePasswordResponse;
  ShopSuccessChangePasswordState({required this.changePasswordResponse});
}

class ShopErrorChangePasswordState extends LoginStates {}
