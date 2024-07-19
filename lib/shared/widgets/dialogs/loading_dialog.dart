
import 'package:flutter/material.dart';
import 'package:progress_soft_app/shared/local/theme/theme.dart';
import 'package:progress_soft_app/shared/widgets/loaders/circular_loader.dart';

class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key});

  @override
  State<LoadingDialog> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: const AlertDialog(
        titlePadding: EdgeInsetsDirectional.only(
          top: 30,
          bottom: 30,
          end: 80,
          start: 20,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: CustomCircularLoader(),
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppTheme.titleColor,
        ),
      ),
    );
  }
}
