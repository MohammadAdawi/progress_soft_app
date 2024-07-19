import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_soft_app/shared/local/theme/theme.dart';

class CustomText extends StatelessWidget {
  final dynamic text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextDecoration? decoration;
  final int? maxLines;
  final TextAlign? textAlign;
  const CustomText({
    super.key,
    this.text = "example text",
    this.fontWeight = FontWeight.w400,
    this.color = AppTheme.blackTextColor,
    this.fontSize,
    this.decoration = TextDecoration.none,
    this.maxLines = 2,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
        decorationColor: AppTheme.redTextolor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
