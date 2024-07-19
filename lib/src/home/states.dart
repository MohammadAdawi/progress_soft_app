abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeSuccessState extends HomeStates {}

class HomeErrorState extends HomeStates {
  final int? errorCode;
  final String? errorMessage;
  HomeErrorState({this.errorCode, this.errorMessage});
}
