import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/input_formatter.dart';
import 'custom_text_goal.dart';

class CustomTextFialedEditGoal extends StatelessWidget {
  final String text;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;


  const CustomTextFialedEditGoal(
      {required this.text, required this.hint, required this.controller, this.keyboardType, this.inputFormatters});

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
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
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
