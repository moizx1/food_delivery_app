import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/ui_constants.dart';
import 'counter.dart';

class SwipeToDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      margin: EdgeInsets.only(left: 24, right: 24, top: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/RoastChicken.png',
            scale: 23,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Fish with mix orange....',
                  style: appBarTextStyle,
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#1,900',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                        color: Color(0xFFFA4A0C),
                      ),
                    ),
                    Counter(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
