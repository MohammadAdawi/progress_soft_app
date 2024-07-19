abstract class ProfileStates {}

class ProfileInitState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileSuccessState extends ProfileStates {}

class ProfileErrorState extends ProfileStates {
  final int? errorCode;
  final String? errorMessage;
  ProfileErrorState({this.errorCode, this.errorMessage});
}
