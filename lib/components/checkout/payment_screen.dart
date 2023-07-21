import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/components/common/custom_appbar.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/common/custom_payment_options.dart';
import 'package:food_delivery_app/components/utils/ui_constants.dart';

class PaymentScreen extends StatelessWidget {
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
              child: Text('Payment',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                    fontSize: 34.0,
                    color: Colors.black,
                  )),
            ),
            Expanded(flex: 2, child: Container()),
            Text('Payment Method', style: profileLabelStyle),
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
                      title: 'Card',
                      paymentBackground: Color(0xFFF47B0A),
                      paymentImage: 'assets/images/Card.png',
                      showIcon: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 28),
                      child: Divider(),
                    ),
                    CustomListTile(
                      value: 2,
                      title: 'Bank',
                      paymentBackground: Color(0xFFEB4796),
                      paymentImage: 'assets/images/Bank.png',
                      showIcon: true,
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
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Color(0xFFFFFFFF),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          titlePadding:
                              EdgeInsets.only(left: 0, right: 0, top: 0),
                          // contentPadding:
                          //     EdgeInsets.only(left: 0, right: 0, top: 0),
                          title: Container(
                            padding: EdgeInsets.only(
                                left: 46, top: 17, right: 152, bottom: 19),
                            decoration: BoxDecoration(
                              color: Color(0xFFEDEDED),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30.0)),
                            ),
                            child: Text(
                              'Please Note',
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('DELIVERY TO MAINLAND',
                                  style: alertTextStyle),
                              Text('N1000 - N2000', style: tabTextStyle),
                              Container(height: 10),
                              Divider(),
                              Container(height: 10),
                              Text('DELIVERY TO ISLAND', style: alertTextStyle),
                              Text('N2000 - N3000', style: tabTextStyle),
                            ],
                          ),
                          actionsPadding: EdgeInsets.only(
                              left: 40, right: 0.0, bottom: 15, top: 10),
                          actions: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17.0,
                                            color: Color.fromARGB(
                                                255, 149, 149, 150)),
                                      )),
                                ),
                                Expanded(
                                    flex: 7,
                                    child: CustomButton(
                                      text: 'Proceed',
                                      onPress: () =>
                                          Navigator.pushNamed(context, '/home'),
                                    )),
                              ],
                            )
                          ],
                        );
                      });
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
