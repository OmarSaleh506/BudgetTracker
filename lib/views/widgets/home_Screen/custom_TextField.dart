import 'package:budget_tracker/views/widgets/customText.dart';
import 'package:budget_tracker/views/widgets/home_Screen/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/input_formatter.dart';


class CustomTextFieldGoal extends StatelessWidget {
  final String text;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextFieldGoal({
    required this.text,
    required this.hint,
    required this.controller,
    this.inputFormatters,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 2.2.w),
          child: CustomTextGoal(
            text: text,
            fontSize: 10.sp,
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
            textAlign: TextAlign.right,
            controller: controller,
            inputFormatters: [DecimalTextInputFormatter(decimalRange: 2)],
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: hint,
    hintStyle: TextStyle(fontSize: 10.sp, color: Colors.black,),
              hintTextDirection: TextDirection.rtl,

            ),
          ),
        ),
      ],
    );
  }
}
