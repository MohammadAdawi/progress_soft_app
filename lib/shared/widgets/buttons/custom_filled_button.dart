import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_soft_app/shared/widgets/texts/custom_text_widget.dart';

import '../../local/theme/theme.dart';

class CustomFilledButton extends StatefulWidget {
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final Color? btnColor;
  final String? btnText;

  const CustomFilledButton({
    super.key,
    this.width = double.infinity,
    this.onTap,
    this.btnColor = AppTheme.primaryColor,
    this.btnText = "Press me",
    this.height = 40,
  });

  @override
  State<CustomFilledButton> createState() => _CustomFilledButtonState();
}

class _CustomFilledButtonState extends State<CustomFilledButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: FilledButton(
        onPressed: widget.onTap ?? () {},
        style: ButtonStyle(
          enableFeedback: false,
          backgroundColor: MaterialStatePropertyAll(
            widget.btnColor,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: CustomText(
          text: widget.btnText,
          color: AppTheme.whiteTextColor,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
