
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_soft_app/app/models/system_config_model.dart';
import 'package:progress_soft_app/main.dart';
import 'package:progress_soft_app/shared/local/helpers/router/app_router.dart';
import '../shared/widgets/dialogs/loading_dialog.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);


  void reRender() {
    emit(RerenderState());
  }

SystemConfig? systemConfig;
  Future<void> getSystemConfigs() async {
        emit(AppLoadingState());

try {CollectionReference users =  FirebaseFirestore.instance.collection('systemConfig');
var response = await users.doc("config").get();
    systemConfig=   SystemConfig.fromJson(response.data()as Map<String, dynamic>);
  } catch (e) {
                    emit(AppErrorState());

      print("Error checking user: $e");
    } }



  void disableUserInteraction() {
    showDialog(
      context: navigatorKey.currentState!.context,
      builder: (context) => const LoadingDialog(),
    );
    emit(DisableUserInteractionState());
  }

  Color getColorBasedOnTheme({
    required BuildContext context,
    required Color lightModeColor,
    required Color darkModeColor,
  }) {
    return Theme.of(context).brightness == Brightness.light
        ? lightModeColor
        : darkModeColor;
  }


  void enableeUserInteraction() {
    AppRouter.pop();
    emit(EnableUserInteractionState());
  }
}
