abstract class SignUpStates {}

class SignUpInitState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}
class SignUpDoneState extends SignUpStates {}

class SignUpErrorState extends SignUpStates {
  final int? errorCode;
  final String? errorMessage;
  SignUpErrorState({this.errorCode, this.errorMessage});
}
