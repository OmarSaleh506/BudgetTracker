import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomTextEditGoal extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontWeight;

  CustomTextEditGoal({
    this.text = '',
    this.fontSize = 14,
    this.color = detailColor,
    this.alignment = Alignment.topRight,
    this.fontWeight = FontWeight.bold,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style:
            TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
      ),
    );
  }
}
