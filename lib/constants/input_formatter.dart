import 'package:flutter/services.dart';
import 'dart:math' as math;

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange, this.beforeDecimalRange})
      : assert(decimalRange == null ||
            decimalRange > 0 ||
            beforeDecimalRange == null ||
            beforeDecimalRange > 0);

  final int? decimalRange;
  final int? beforeDecimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    String value;

    if (beforeDecimalRange != null) {
      value = newValue.text;

      if (value.contains(".")) {
        if (value.split(".")[0].length > beforeDecimalRange!) {
          truncated = oldValue.text;
          newSelection = oldValue.selection;
        }
      } else {
        if (value.length > beforeDecimalRange!) {
          truncated = oldValue.text;
          newSelection = oldValue.selection;
        }
      }
    }

    if (decimalRange != null) {
      value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange!) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
