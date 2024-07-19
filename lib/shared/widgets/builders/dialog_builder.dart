import 'package:flutter/material.dart';
import 'package:progress_soft_app/app/app_cubit.dart';

class DialogBuilder {
  static void buildDialog({
    required BuildContext context,
    required Widget child,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      useSafeArea: false,
      builder: (context) => child,
    ).then((value) =>     AppCubit.get(context).reRender()
);
  }
}
