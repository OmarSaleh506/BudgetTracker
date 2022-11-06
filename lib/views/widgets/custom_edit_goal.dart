import 'package:budget_tracker/views/widgets/customText.dart';
import 'package:budget_tracker/views/widgets/home_Screen/custom_text.dart';
import 'package:flutter/material.dart';

import 'custom_text_goal.dart';

class CustomTextFialedEditGoal extends StatelessWidget {
  final String text;
  final String? hint;
  final TextEditingController? controller;

  const CustomTextFialedEditGoal(
      {required this.text, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CustomTextEditGoal(
            text: text,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: hint,
                hintTextDirection: TextDirection.rtl,
                hintStyle: TextStyle(color: Colors.black)),
          ),
        ),
      ],
    );
  }
}
