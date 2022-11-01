import 'package:budget_tracker/views/widgets/customText.dart';
import 'package:budget_tracker/views/widgets/home_Screen/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFieldGoal extends StatelessWidget {
  final String text;
  final String? hint;
  final TextEditingController? controller;

  const CustomTextFieldGoal(
      {required this.text, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomTextGoal(
          text: text,
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
