import 'package:ntigradproject/feature/auth/login/data/model/login_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState({required this.loginModel});
}

class LoginFailingState extends LoginState {
  final String errMessage;

  LoginFailingState({required this.errMessage});
}

class LoginNotValidateState extends LoginState {}
