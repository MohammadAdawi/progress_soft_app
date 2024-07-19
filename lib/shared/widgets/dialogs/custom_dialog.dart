import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:progress_soft_app/app/app_cubit.dart';
import 'package:progress_soft_app/shared/local/theme/theme.dart';


import '../texts/custom_text_widget.dart';

class CustomDialog extends StatefulWidget {
  final String? dialogTitle;
  final String? dialogSubtitle;
  final bool? isOptionDialog; //! true = has 2 buttons and false = has 1 button
  final String? confirmText;
  final String? cancelText;
  final String? singleButtonText;
  final VoidCallback? confirmOnPressed;
  final VoidCallback? cancelOnPressed;
  final VoidCallback? singleButtonOnPressed;
  final Widget? topWidget;
  final bool? isBackButtonEnabled;
  const CustomDialog({
    super.key,
    this.confirmOnPressed,
    this.isOptionDialog = true,
    this.confirmText,
    this.cancelText,
    this.singleButtonText,
    this.dialogTitle,
    this.dialogSubtitle,
    this.topWidget,
    this.cancelOnPressed,
    this.singleButtonOnPressed,
    this.isBackButtonEnabled = true,
  });

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return widget.isOptionDialog == true
        ? WillPopScope(
            onWillPop: () async => widget.isBackButtonEnabled!,
            child: AlertDialog(
              surfaceTintColor: AppCubit.get(context).getColorBasedOnTheme(
                context: context,
                lightModeColor: Theme.of(context).scaffoldBackgroundColor,
                darkModeColor: Colors.black,
              ),
              title: Column(
                children: [
                  widget.topWidget ?? const SizedBox.shrink(),
                  widget.topWidget != null
                      ? const Gap(12)
                      : const SizedBox.shrink(),
                  Text(
                    widget.dialogTitle ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              content: Text(
                widget.dialogSubtitle ?? "",
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      onPressed: widget.cancelOnPressed,
                      icon: const Icon(Icons.cancel),
                      label: Text(widget.cancelText ?? ""),
                    ),
                    const Gap(20),
                    FilledButton.icon(
                      onPressed: widget.confirmOnPressed,
                      icon: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      label: Text(
                        widget.confirmText ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        backgroundColor: const WidgetStatePropertyAll(
                          AppTheme.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : WillPopScope(
            onWillPop: () async => widget.isBackButtonEnabled!,
            child: AlertDialog(
              surfaceTintColor: AppCubit.get(context).getColorBasedOnTheme(
                context: context,
                lightModeColor: Theme.of(context).scaffoldBackgroundColor,
                darkModeColor: Colors.black,
              ),
              title: Column(
                children: [
                  widget.topWidget ?? const SizedBox.shrink(),
                  const Gap(12),
                  CustomText(
                    text: widget.dialogTitle,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.blackTextColor,
                  )
                ],
              ),
              content: CustomText(
                text: widget.dialogSubtitle,
                color: AppTheme.dialogTitleColor,
                fontWeight: FontWeight.w400,
                fontSize: 13.sp,
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                FilledButton(
                  onPressed: widget.singleButtonOnPressed,
                  style: ButtonStyle(
                    minimumSize: WidgetStatePropertyAll(
                      Size(
                        double.infinity,
                        35.h,
                      ),
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    backgroundColor: const WidgetStatePropertyAll(
                      AppTheme.primaryColor,
                    ),
                  ),
                  child: CustomText(
                    text: widget.singleButtonText,
                    color: AppTheme.whiteTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                )
              ],
            ),
          );
  }
}
