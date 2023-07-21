import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/components/common/custom_appbar.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/common/custom_payment_options.dart';
import 'package:food_delivery_app/components/utils/ui_constants.dart';

class DeliveryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: CustomAppBar(title: 'Checkout'),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 37.0, right: 37.0, top: 0, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: Text('Delivery',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                    fontSize: 34.0,
                    color: Colors.black,
                  )),
            ),
            Expanded(flex: 2, child: Container()),
            Text('Address Details', style: profileLabelStyle),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Marvis Kparobo',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0,
                      ),
                    ),
                    Divider(),
                    Text(
                      'Km 5 refinery road oppsite republic road, effurun, delta state',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),
                    ),
                    Divider(),
                    Text(
                      '+234 9011039271',
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Text('Delivery Method', style: profileLabelStyle),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    CustomListTile(
                      value: 1,
                      title: 'Door delivery',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 28),
                      child: Divider(),
                    ),
                    CustomListTile(
                      value: 2,
                      title: 'Pick up',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: tabTextStyle,
                  ),
                  Text(
                    '23000',
                    style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w600,
                      fontSize: 22.0,
                    ),
                  )
                ],
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 0,
              child: CustomButton(
                text: 'Proceed to payment',
                isMargin: false,
                onPress: () {
                  Navigator.pushNamed(context, '/payment');
                },
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ),
    );
  }
}
