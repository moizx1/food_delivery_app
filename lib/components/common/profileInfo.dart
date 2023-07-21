import 'package:flutter/material.dart';

import '../utils/ui_constants.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({this.title = ''});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: profileNameStyle),
            Icon(Icons.arrow_forward_ios, size: 20),
          ],
        ),
      ),
    );
  }
}
