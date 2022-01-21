import 'package:flutter/material.dart';
import 'package:thaana/thaana_text_formatter.dart';

/*
* TextField widget with default settings of a
* Thaana TextField (textDirection & fontFamily)
*
* Usage:
*   ThaanaTextField(
*     controller: myTextEditingController,
*     style: TextStyle(...),
*   );
*/

class ThaanaTextField extends StatefulWidget {
  /*
  * Declare additional properties of a TextField if required
  * and pass it to the constructor
  */

  final TextEditingController? controller;
  final TextStyle? style;

  const ThaanaTextField({Key? key, this.controller, this.style})
      : super(key: key);

  @override
  _ThaanaTextFieldState createState() => _ThaanaTextFieldState();
}

class _ThaanaTextFieldState extends State<ThaanaTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textDirection: TextDirection.rtl,
      controller: widget.controller,
      inputFormatters: [
        ThaanaTextFormatter(), // Using our custom ThaanaTextFormatter
      ],
      style: widget.style == null
          ? const TextStyle(fontFamily: 'MVTypeWriter')
          : widget.style?.apply(fontFamilyFallback: ['MVTypeWriter']),
    );
  }
}
