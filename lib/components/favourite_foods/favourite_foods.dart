import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_delivery_app/components/common/custom_appbar.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/common/food_card.dart';
import '../utils/ui_constants.dart';

class FavouriteFoods extends StatefulWidget {
  @override
  State<FavouriteFoods> createState() => _FavouriteFoodsState();
}

class _FavouriteFoodsState extends State<FavouriteFoods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: CustomAppBar(title: 'Favourites'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return Text('hi');
              }),
            ),
            Expanded(flex: 4, child: Container()),
            Expanded(
              flex: 0,
              child: CustomButton(
                text: 'Add to cart',
                isMargin: false,
                onPress: () => Navigator.pushNamed(context, '/cart'),
              ),
            ),
            Expanded(flex: 3, child: Container()),
          ],
        ),
      ),
    );
  }
}
