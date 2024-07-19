import 'package:flutter/material.dart';

class DefaultDivider extends StatelessWidget {
  final double height;
  final Color color;

  DefaultDivider({
    this.height = 0.5,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: Container(
        color: color,
        height: height,
      ),
    );
  }
}
