import 'package:flutter/services.dart';

import 'thaana_extensions.dart';

/*
* Input Formatter for TextFields which will convert the
* value of TextField to Thaana after every text change
*/

class ThaanaTextFormatter extends TextInputFormatter {
  final ThaanaControllerMode mode;
  ThaanaTextFormatter(this.mode);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: mode == ThaanaControllerMode.latin
          ? newValue.text.convertLatinToThaana()
          : newValue.text.convertAsciiToThaana(),
      selection: newValue.selection,
    );
  }
}
