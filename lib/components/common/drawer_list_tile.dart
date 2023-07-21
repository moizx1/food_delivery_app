import 'package:flutter/material.dart';

import '../utils/ui_constants.dart';

class DrawerListTile extends StatelessWidget {
  DrawerListTile(
      {required this.icon, required this.title, this.isDivider = true});
  final String title;
  final Icon icon;
  final bool isDivider;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 15),
          onTap: () {},
          leading: icon,
          title: Text(title, style: profileLabelStyle),
        ),
        if (isDivider)
          Padding(
            padding: const EdgeInsets.only(left: 55.0, right: 28),
            child: Divider(),
          )
      ],
    );
  }
}
