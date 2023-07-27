import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/common/custom_appbar.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/common/custom_payment_options.dart';
import 'package:food_delivery_app/components/utils/ui_constants.dart';
import 'package:food_delivery_app/model/order_model.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({this.arguments});
  final arguments;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? deliveryMethod;
  String? paymentMethod = 'card';
  OrderModel orderModel = OrderModel();

  onPaymentChange(value) {
    setState(() {
      paymentMethod = value;
    });
  }

  onDeliveryChange(value) {
    setState(() {
      deliveryMethod = value;
    });
  }

  @override
  void initState() {
    super.initState();
    orderModel = widget.arguments;
    
    deliveryMethod = orderModel.chooseDeliveryMethod;
  }

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
                      value: 'card',
                      title: 'Card',
                      paymentBackground: Color(0xFFF47B0A),
                      paymentImage: 'assets/images/Card.png',
                      showIcon: true,
                      groupValue: paymentMethod,
                      onChange: onPaymentChange,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 28),
                      child: Divider(),
                    ),
                    CustomListTile(
                      value: 'bank',
                      title: 'Bank',
                      paymentBackground: Color(0xFFEB4796),
                      paymentImage: 'assets/images/Bank.png',
                      showIcon: true,
                      groupValue: paymentMethod,
                      onChange: onPaymentChange,
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
                      groupValue: deliveryMethod,
                      onChange: onDeliveryChange,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 28),
                      child: Divider(),
                    ),
                    CustomListTile(
                      value: 'pickUp',
                      title: 'Pick up',
                      groupValue: deliveryMethod,
                      onChange: onDeliveryChange,
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
                    orderModel.totalPrice.toString(),
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
                                      onPress: () async {
                                        deliveryMethod == 'doorDelivery'
                                            ? orderModel.deliveryMethod = {
                                                'doorDelivery': true,
                                                'pickUp': false
                                              }
                                            : orderModel.deliveryMethod = {
                                                'doorDelivery': false,
                                                'pickUp': true
                                              };
                                        paymentMethod == 'card'
                                            ? orderModel.paymentMethod = {
                                                'card': true,
                                                'bank': false
                                              }
                                            : orderModel.paymentMethod = {
                                                'card': false,
                                                'bank': true
                                              };

                                        OrderModel uploadDocument = OrderModel(
                                            cartList: orderModel.cartList,
                                            deliveryMethod:
                                                orderModel.deliveryMethod,
                                            paymentMethod:
                                                orderModel.paymentMethod,
                                            totalPrice: orderModel.totalPrice);
                                        await _firestore
                                            .collection("orders")
                                            .doc()
                                            .set(uploadDocument
                                                .toJson()) // <-- Updated data
                                            .then((_) {
                                          Navigator.pushNamed(context, '/home');
                                        });
                                      },
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
