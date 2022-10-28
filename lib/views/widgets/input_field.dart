
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            
          ),
          Container(
            height: 48,
            margin: EdgeInsets.only(
              top: 6,
            ),
            padding: EdgeInsets.only(
              left: 14,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType:
                        isAmount! ? TextInputType.number : TextInputType.text,
                    readOnly: widget == null ? false : true,
                    autofocus: false,
                   
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
          )
        ],
      ),
    );
  }
}