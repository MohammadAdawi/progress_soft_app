import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_soft_app/shared/local/theme/theme.dart';



class DefaultTextButton extends StatelessWidget {
  final VoidCallback function;
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const DefaultTextButton({
    Key? key,
    required this.function,
    required this.text,
    this.color = AppTheme.primaryColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w700,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}




class DefaultButton extends StatelessWidget {
  final double? width;
  final double height;
  final double radius;
  final void Function()? onPressed;
  final String text;

  const DefaultButton({
    Key? key,
    this.width,
    this.height = 50,
    this.radius = 8,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
          borderSide: const BorderSide(color: Color.fromARGB(0, 255, 255, 255)),
        ),
        onPressed: onPressed,
        color: AppTheme.primaryColor,
        disabledColor: Color.fromARGB(129, 1, 52, 102),
        minWidth: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
