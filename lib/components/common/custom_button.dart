import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.text,
      this.textColor = Colors.white,
      this.backColor = const Color(0xFFFA4A0C),
      this.onPress,
      this.isMargin = true});
  final String text;
  final Color textColor;
  final Color backColor;
  final VoidCallback? onPress;
  final bool isMargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 70.0,
        margin:
            isMargin == true ? EdgeInsets.only(left: 30.0, right: 30.0) : null,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: Center(
          child: Text(
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w600,
                fontSize: 17.0,
                color: textColor,
              ),
              text),
        ),
      ),
    );
  }
}
