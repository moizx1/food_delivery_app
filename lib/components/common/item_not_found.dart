import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
              iconSize: 135,
              color: Color(0xFFC7C7C7)),
          SizedBox(height: 10),
          Text(
            'Item not found',
            style: TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w600,
              fontSize: 28.0,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Try searching the item with',
            style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
                fontSize: 17.0,
                color: Color.fromARGB(255, 149, 149, 150)),
          ),
          Text(
            'with a different keyword.',
            style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w400,
                fontSize: 17.0,
                color: Color.fromARGB(255, 149, 149, 150)),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
