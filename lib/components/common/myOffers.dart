import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/common/item_not_found.dart';

import 'custom_appbar.dart';

class MyOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: CustomAppBar(),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 37.0, right: 37.0, top: 0, bottom: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: Text(
                'My Offers',
                style: TextStyle(
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w600,
                  fontSize: 34.0,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'ohh snap!  No offers yet',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600,
                      fontSize: 28.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bella doesn’t have any offers',
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0,
                        color: Color.fromARGB(255, 149, 149, 150)),
                  ),
                  Text(
                    'yet please check again.',
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0,
                        color: Color.fromARGB(255, 149, 149, 150)),
                  ),
                ],
              ),
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
