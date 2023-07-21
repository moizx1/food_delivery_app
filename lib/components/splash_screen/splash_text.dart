import 'package:flutter/material.dart';

class SplashText extends StatelessWidget {
  SplashText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w800,
          fontSize: 60.0,
          letterSpacing: -0.5,
          color: Colors.white,
        ),
      ),
    );
  }
}
