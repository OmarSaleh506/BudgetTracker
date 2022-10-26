import 'package:budget_tracker/views/widgets/customText.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final String? hint;
  final void Function(String?)? onSave;

  const CustomTextField(
      {required this.text, required this.hint, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
        ),
        SizedBox(height: 10,),
        TextFormField(
          onSaved: onSave,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: '2000...',
          ),
        ),
      ],
    );
  }
}
