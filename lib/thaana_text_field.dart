import 'package:flutter/material.dart';
import 'package:thaana/thaana_extensions.dart';
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
  final TextStyle style;
  final ThaanaControllerMode mode;

  const ThaanaTextField({
    Key? key,
    this.controller,
    this.style = const TextStyle(fontFamily: 'MVTypeWriter'),
    this.mode = ThaanaControllerMode.ascii,
  }) : super(key: key);

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
        ThaanaTextFormatter(
          widget.mode,
        ), // Using our custom ThaanaTextFormatter
      ],
      style: widget.style.apply(fontFamilyFallback: ['MVTypeWriter']),
    );
  }
}
