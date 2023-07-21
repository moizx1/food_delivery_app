import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';

class NoConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 53.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off_rounded,
                  size: 175,
                  color: Color(0xFFC7C7C7),
                ),
                SizedBox(),
                Text(
                  'No internet Connection',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Your internet connection is currently not available please check or try again.',
                  style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0,
                      color: Color.fromARGB(255, 149, 149, 150)),
                ),
                SizedBox(height: 40),
                CustomButton(text: 'Try again', isMargin: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
