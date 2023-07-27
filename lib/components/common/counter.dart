import 'package:flutter/material.dart';

import '../utils/ui_constants.dart';

class Counter extends StatelessWidget {
  Counter({required this.updateQuantity, this.quantity = 1});
  final void Function(int) updateQuantity;
  int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.5),
      // height: 22.5,
      //width: 52,
      decoration: BoxDecoration(
          color: Color(0xFFFA4A0C), borderRadius: BorderRadius.circular(30)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              if (quantity > 1) {
                updateQuantity(--quantity);
              }
            },
            child: Icon(
              Icons.remove,
              size: 15,
              color: Color(0xFFF4F4F7),
            ),
          ),
          SizedBox(width: 8),
          Text(quantity.toString(), style: counterTextStyle),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              updateQuantity(++quantity);
            },
            child: Icon(
              Icons.add,
              size: 15,
              color: Color(0xFFF4F4F7),
            ),
          ),
        ],
      ),
    );
  }
}
