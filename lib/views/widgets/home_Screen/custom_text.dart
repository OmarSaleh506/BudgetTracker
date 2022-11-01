import 'package:flutter/material.dart';

class CustomTextGoal extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final FontWeight fontWeight;

  CustomTextGoal(
      {this.text = '',
      this.fontSize = 14,
      this.color = const Color(0xff0A1931),
      this.alignment = Alignment.topRight,
      this.fontWeight = FontWeight.bold});
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
