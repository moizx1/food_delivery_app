import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/ui_constants.dart';

class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

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
              if (count > 0) {
                setState(() {
                  count--;
                });
              }
            },
            child: Icon(
              Icons.remove,
              size: 15,
              color: Color(0xFFF4F4F7),
            ),
          ),
          SizedBox(width: 8),
          Text(count.toString(), style: counterTextStyle),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                count++;
              });
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
