// import 'package:easy_localization/easy_localization.dart';


import 'package:flutter/material.dart';
import 'package:progress_soft_app/app/app_cubit.dart';
import 'package:progress_soft_app/shared/widgets/dialogs/custom_dialog.dart';


class Validators {
  static String? validateRequiredField({required String controllerText}) {
    String? message;
    if (controllerText.trim().isEmpty) {
      message = "This field is required";
    }
    return message;
  }

  static String? validateRequiredFieldWithLength(
      {required String controllerText, required int length}) {
    String? message;
    if (controllerText.trim().isEmpty) {
      message = "This field is required";
    } else if (controllerText.trim().length != length) {
      message = "Invalid input";
    }
    return message;
  }



  static String? validatePasswordAndConfirmPassword({
    String? passwordControllerText,
    String? confirmPasswordControllerText,
  }) {
    passwordControllerText = passwordControllerText?.trim();
    confirmPasswordControllerText = confirmPasswordControllerText?.trim();
    String? message;
    if (passwordControllerText == null || passwordControllerText.isEmpty) {
      message = 'Password is required';
      return message;
    }

    if (confirmPasswordControllerText == null ||
        confirmPasswordControllerText.isEmpty) {
      message = "Confirm password is required";
      return message;
    }
    if (passwordControllerText != confirmPasswordControllerText) {
      message = "Passwords do not match";
      return message;
    }
    return message;
  }

  static String? validatePassword({
    String? passwordControllerText,
   required BuildContext context,
  }) {
    print(AppCubit.get(context).systemConfig!.passwordRegex);
    String? message;
    if (passwordControllerText!.trim().isEmpty) {
      message = "This field is required";
      return message;
    }
    if (!RegExp(AppCubit.get(context).systemConfig!.passwordRegex).hasMatch(passwordControllerText)) {
      message =
         "Please enter a valid password";
      return message;
    }
    return message;
  }

  static String validatePhoneNumber({
    required String phoneNumberController,
    required BuildContext context,
  }) {
    String? message;
      if (!RegExp(AppCubit.get(context).systemConfig!.mobileRegex).hasMatch(phoneNumberController)) {
      message = 'Please enter a valid phone number';
      return message;
    }
    return message!;
  }
}
