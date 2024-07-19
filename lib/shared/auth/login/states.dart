abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final int? errorCode;
  final String? errorMessage;
  LoginErrorState({this.errorCode, this.errorMessage});
}
