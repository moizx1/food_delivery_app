import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:food_delivery_app/components/common/custom_appbar.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/common/custom_payment_options.dart';
import 'package:food_delivery_app/components/utils/ui_constants.dart';
import 'package:food_delivery_app/model/order_model.dart';

import '../../model/food_model.dart';

class DeliveryScreen extends StatefulWidget {
  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  OrderModel orderModel = OrderModel();
  Map<String, bool>? deliveryMethod;
  List<Map<String, dynamic>> items = [];

  String? groupValue = 'doorDelivery';
  onRadioChange(value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<FoodModel> cartList =
        ModalRoute.of(context)!.settings.arguments as List<FoodModel>;

    int calculate = 0;
    for (int i = 0; i < cartList.length; i++) {
      calculate += cartList[i].quantity! * cartList[i].price!;
    }
    String total = calculate.toString();

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
                      value: 'doorDelivery',
                      title: 'Door delivery',
                      groupValue: groupValue,
                      onChange: onRadioChange,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 28),
                      child: Divider(),
                    ),
                    CustomListTile(
                      value: 'pickUp',
                      title: 'Pick up',
                      groupValue: groupValue,
                      onChange: onRadioChange,
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
                    total,
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
                  if (groupValue != null) {
                    for (int i = 0; i < cartList.length; i++) {
                      items.add({
                        'foodId': cartList[i].foodId,
                        'quantity': cartList[i].quantity
                      });
                    }
                    orderModel.cartList = items;
                    orderModel.totalPrice = calculate;
                    orderModel.chooseDeliveryMethod = groupValue;

                    Navigator.pushNamed(context, '/payment',
                        arguments: orderModel);
                  }
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
