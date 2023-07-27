import 'package:flutter/material.dart';

import '../utils/ui_constants.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile(
      {required this.value,
      required this.groupValue,
      required this.title,
      required this.onChange,
      this.paymentBackground = Colors.white,
      this.paymentImage = 'assets/images/Card.png',
      this.showIcon = false});
  String? value,groupValue;
  void Function(dynamic)? onChange;
  late Color paymentBackground;
  late String paymentImage, title;
  late bool showIcon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 5,
      title: Row(
        children: [
          if (showIcon)
            Container(
              margin: EdgeInsets.only(right: 11),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: paymentBackground,
              ),
              child: Image.asset(paymentImage),
            ),
          Text(
            title,
            style: tabTextStyle,
          ),
        ],
      ),
      leading: Radio<dynamic>(
        activeColor: Color(0xFFFA4A0C),
        value: value,
        groupValue: groupValue,
        onChanged: onChange,
      ),
    );
  }
}
