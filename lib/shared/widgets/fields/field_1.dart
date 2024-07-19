import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_soft_app/shared/local/theme/theme.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String?)? validate;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final Color fillColor;
  final String? hintText;
  final bool isPassSec;
  final bool obscureText;
  final bool? enabled;
  final double? width;
  final double? height;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;

  const DefaultFormField({
    Key? key,
    required this.controller,
    required this.type,
    this.validate,
    this.onSubmit,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.fillColor = AppTheme.whiteTextColor,
    this.hintText,
    this.isPassSec = false,
    this.obscureText = false,
    this.enabled,
    this.width,
    this.height,
    this.suffixIcon,
    this.inputFormatters,
    this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 361.w,
      height: height ?? null,
      child: TextFormField(
        readOnly: readOnly ?? false,
        inputFormatters: inputFormatters,
        enabled: enabled,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        obscureText: obscureText,
        controller: controller,
        keyboardType: type,
        validator: validate,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: fillColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppTheme.primaryColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: Color(0xFFD6D7D9),
              width: 1.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: Color(0xFFD6D7D9),
              width: 1.0,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              )),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(
                width: 1,
                color: Colors.red,
              )),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFF98A2B3)),
        ),
        style: TextStyle(
          color: AppTheme.textFieldTextColor,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
