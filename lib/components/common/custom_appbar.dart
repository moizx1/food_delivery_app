import 'package:flutter/material.dart';

import '../utils/ui_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({this.title = ''});
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(65);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 100,
      leadingWidth: 82.5,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            IconData(0xee84,
                fontFamily: 'MaterialIcons', matchTextDirection: true),
            size: 18,
          )),
      centerTitle: true,
      title: Text(title, style: appBarTextStyle),
      backgroundColor: Color(0xFFF2F2F2),
    );
  }
}
