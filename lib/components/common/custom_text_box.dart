import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  CustomTextBox(
      {this.onChange,
      this.visibleText,
      required this.textLabel,
      this.validatorString,
      this.containerColor = Colors.black,
      this.textType,
      this.validateText,
      this.initialValue,
      this.isMargin = true});
  final bool? visibleText;
  final Function(String)? onChange;
  final String? textLabel, validatorString, initialValue;
  final Color containerColor;
  final TextInputType? textType;
  final String? Function(String?)? validateText;
  final bool isMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMargin ? EdgeInsets.only(left: 30.0, right: 30.0) : null,
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: textType,
        obscureText: visibleText ?? false,
        cursorColor: containerColor,
        decoration: InputDecoration(
          // errorText: validateText ? validatorString : null,
          labelText: textLabel,
          labelStyle: TextStyle(color: containerColor),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: containerColor)),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validateText ??
            (value) {
              String? v = value.toString().trim();
              return (v.isEmpty) ? 'Provide $textLabel' : null;
            },
        onChanged: onChange,
      ),
    );
  }
}
