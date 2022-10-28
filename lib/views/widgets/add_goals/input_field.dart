import 'package:flutter/material.dart';

import '../../../constants/theme.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final bool? isAmount;
  final TextEditingController? controller;
  final Widget? widget;
  InputField({
    Key? key,
    required this.hint,
    required this.label,
    this.isAmount = false,
    this.controller,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Themes().labelStyle,
          ),
          Card(
            margin: EdgeInsets.only(
              top: 5,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 5, 0, 5),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType:
                          isAmount! ? TextInputType.number : TextInputType.text,
                      readOnly: widget == null ? false : true,
                      autofocus: false,
                      cursorColor: Colors.black,
                      controller: controller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hint,
                      ),
                    ),
                  ),
                  widget == null
                      ? Container()
                      : Container(
                          child: widget,
                        )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
