abstract class AppStates {}

class AppInitState extends AppStates {}

class AppLoadingState extends AppStates {}

class AppErrorState extends AppStates {
  String? errorMsg;
  AppErrorState({this.errorMsg});
}

class EnableUserInteractionState extends AppStates {}

class RerenderState extends AppStates {}

class DisableUserInteractionState extends AppStates {}
