import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/common/custom_appbar.dart';

import 'custom_button.dart';

class NoHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: CustomAppBar(title: 'History'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 53.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Column(
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  size: 150,
                  color: Color(0xFFC7C7C7),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'No history yet',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                    fontSize: 28.0,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Hit the orange button down',
                  style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0,
                      color: Color.fromARGB(255, 149, 149, 150)),
                ),
                Text(
                  'below to Create an order',
                  style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w400,
                      fontSize: 17.0,
                      color: Color.fromARGB(255, 149, 149, 150)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: CustomButton(text: 'Start Ordering', isMargin: false),
            )
          ],
        ),
      ),
    );
  }
}
