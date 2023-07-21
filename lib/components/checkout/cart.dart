import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/checkout/slidableListTile.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/common/swipeToDelete.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../common/custom_appbar.dart';
import '../utils/ui_constants.dart';
import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final BorderRadius borderRadius = BorderRadius.circular(30.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: CustomAppBar(title: 'Cart'),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/swipe.png'),
              Text(
                'swipe on an item to delete',
                style: profileNameStyle,
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (context, index) {
                // return SlidableListTile(SwipeToDelete());
              },
            ),
          ),
          SizedBox(height: 30),
          CustomButton(
            text: 'Complete Order',
            onPress: () => Navigator.pushNamed(context, '/delivery'),
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
