import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String label;
  final TextInputType inputType;
  final bool isSecure;
  final double fontSize;
  final Color color;
  final TextEditingController textEditingController;

  const InputText(
      {@required this.label,
      this.inputType,
      this.color,
      @required this.isSecure,
      @required this.fontSize,
      @required this.textEditingController});

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputType,
      obscureText: widget.isSecure,
      controller: widget.textEditingController,
      style: TextStyle(
        color: Colors.white
      ),
      decoration: InputDecoration(
        
        focusColor: Colors.blue,
          labelText: widget.label,
          alignLabelWithHint: true,
          labelStyle: TextStyle(fontSize: widget.fontSize, color: Colors.white70),
          contentPadding: EdgeInsets.symmetric(vertical: 8.0)),
    );
  }
}
