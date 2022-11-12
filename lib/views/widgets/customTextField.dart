import 'package:budget_tracker/views/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String? hint;
  final TextEditingController? controller;

  const CustomTextField(
      {required this.text, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 10.sp,
        ),
        SizedBox(
          height: 1.h,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hint,
                hintStyle: TextStyle(fontSize: 10.sp),
              hintTextDirection: TextDirection.rtl),
        ),
      ],
    );
  }
}
