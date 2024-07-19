import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../local/theme/theme.dart';
import 'custom_dialog.dart';

class ErrorDialog extends StatefulWidget {
  final VoidCallback onSingleButtonPressed;
  final String? subTitle;
  final bool? isBackButtonEnabled;
  const ErrorDialog({
    super.key,
    required this.onSingleButtonPressed,
    this.subTitle,
    this.isBackButtonEnabled = true,
  });

  @override
  State<ErrorDialog> createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      isBackButtonEnabled: widget.isBackButtonEnabled,
      isOptionDialog: false,
      dialogTitle: "try again",
      dialogSubtitle: widget.subTitle,
      singleButtonText: "ok",
      singleButtonOnPressed: widget.onSingleButtonPressed,
      topWidget: Icon(
        Icons.error_outline,
        color: AppTheme.primaryColor,
        size: 26.sp,
      ),
    );
  }
}
