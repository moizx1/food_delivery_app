import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/constants/constants.dart';
import '../utils/ui_constants.dart';

class FoodInfo extends StatefulWidget {
  @override
  State<FoodInfo> createState() => _FoodInfoState();
}

class _FoodInfoState extends State<FoodInfo> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _currentPosition = 0;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    DocumentSnapshot item =
        ModalRoute.of(context)!.settings.arguments as DocumentSnapshot;
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          toolbarHeight: 100,
          leadingWidth: 66,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              IconData(0xee84,
                  fontFamily: 'MaterialIcons', matchTextDirection: true),
              size: 18,
            ),
          ),
          backgroundColor: Color(0xFFEDEDED),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                onPressed: () async {
                  try {
                    if (userData!.favouriteFoods?.contains(item.id) ?? false) {
                      await _firestore
                          .collection('users')
                          .doc(userData!.email)
                          .update({
                        'favouriteFood': FieldValue.arrayRemove([item.id])
                      }).then((_) {
                        setState(() {
                          userData!.favouriteFoods?.remove(item.id);
                        });
                      }).catchError((error) {
                        print("Failed to update user: $error");
                      });
                    } else {
                      await _firestore
                          .collection('users')
                          .doc(userData!.email)
                          .update({
                        'favouriteFood': FieldValue.arrayUnion([item.id])
                      }).then((_) {
                        setState(() {
                          userData!.favouriteFoods = [];
                          userData!.favouriteFoods?.add(item.id);
                          print(userData!.favouriteFoods);
                        });
                      }).catchError((error) {
                        print("Failed to update user: $error");
                      });
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                icon: userData != null &&
                        userData!.favouriteFoods != null &&
                        userData!.favouriteFoods!.contains(item.id)
                    ? FaIcon(FontAwesomeIcons.solidHeart)
                    : FaIcon(FontAwesomeIcons.heart),
                iconSize: 18,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///////Slider
            Expanded(
              flex: 0,
              child: CarouselSlider.builder(
                itemCount: 1,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  child: Image.network(item['image']),
                ),
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPosition = index;
                    });
                  },
                ),
              ),
            ),

            Expanded(flex: 1, child: Container()),
            //////Dots Indicator
            Expanded(
              flex: 0,
              child: Align(
                heightFactor: 2,
                alignment: Alignment.center,
                child: DotsIndicator(
                  decorator: DotsDecorator(
                      size: Size.fromRadius(4),
                      activeSize: Size.fromRadius(4),
                      activeColor: Color(0xFFFA4A0C),
                      color: Color(0xFFC4C4C4)),
                  dotsCount: 1,
                  position: _currentPosition,
                ),
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  item['name'],
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                    fontSize: 28.0,
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 0,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Rs ${item['price'].toString()}',
                  style: TextStyle(
                      fontFamily: 'SF Pro',
                      fontWeight: FontWeight.w700,
                      fontSize: 28.0,
                      color: Color(0xFFFA4A0C)),
                ),
              ),
            ),
            Expanded(flex: 4, child: Container()),
            Expanded(
                flex: 0,
                child: Text('Delivery info', style: profileLabelStyle)),
            Expanded(
              flex: 0,
              child: Text(
                'Delivered between monday aug and thursday 20 from 8pm to 91:32 pm',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 149, 149, 150)),
              ),
            ),
            Expanded(flex: 3, child: Container()),
            Expanded(
                flex: 0,
                child: Text('Return policy', style: profileLabelStyle)),
            Expanded(
              flex: 0,
              child: Text(
                'All our foods are double checked before leaving our stores so by any case you found a broken food please contact our hotline immediately.',
                style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    color: Color.fromARGB(255, 149, 149, 150)),
              ),
            ),
            Expanded(flex: 4, child: Container()),
            Expanded(
              flex: 0,
              child: CustomButton(
                text: 'Add to cart',
                isMargin: false,
                onPress: () async {
                  await _firestore
                      .collection('users')
                      .doc(userData!.email)
                      .collection('cart')
                      .doc(item.id)
                      .set({'foodId': item.id, 'quantity': 1});
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ),
            Expanded(flex: 3, child: Container()),
          ],
        ),
      ),
    );
  }
}
