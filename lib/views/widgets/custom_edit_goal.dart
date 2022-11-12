import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../constants/input_formatter.dart';
import 'custom_text_goal.dart';

class CustomTextFialedEditGoal extends StatelessWidget {
  final String text;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFialedEditGoal({
    required this.text,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 2.2.w),
          child: CustomTextEditGoal(
            text: text,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white, width: 1.w),
            borderRadius: BorderRadius.circular(2.w),
          ),
          child: TextFormField(
            controller: controller,
            inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: hint,
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
