import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class CustomLottieBuilder extends StatefulWidget {
  final String lottiePath;
  final double? height;
  final double? width;
  final bool? repeat;
  const CustomLottieBuilder({
    super.key,
    required this.lottiePath,
    this.height = 90,
    this.width = 120,
    this.repeat = false,
  });

  @override
  State<CustomLottieBuilder> createState() => CustomLottieBuilderState();
}

class CustomLottieBuilderState extends State<CustomLottieBuilder> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.lottiePath,
      repeat: widget.repeat,
      height: widget.height,
      width: widget.width,
    );
  }
}
