import 'package:budget_tracker/views/widgets/customText.dart';
import 'package:budget_tracker/views/widgets/home_Screen/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CustomTextFieldGoal extends StatelessWidget {
  final String text;
  final String? hint;
  final TextEditingController? controller;
    final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFieldGoal(
      {required this.text, required this.hint, required this.controller,this.inputFormatters,this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CustomTextGoal(
            text: text,
            fontSize: 10.sp,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          child: TextFormField(
            textAlign: TextAlign.right,
            controller: controller,
              inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hint,
                hintStyle: TextStyle(fontSize: 10.sp),
            ),
          ),
        ),
      ],
    );
  }
}
