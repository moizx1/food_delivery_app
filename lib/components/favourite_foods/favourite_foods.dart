import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:food_delivery_app/components/common/custom_appbar.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/common/food_card.dart';
import 'package:food_delivery_app/constants/constants.dart';
import '../utils/ui_constants.dart';

class FavouriteFoods extends StatefulWidget {
  @override
  State<FavouriteFoods> createState() => _FavouriteFoodsState();
}

class _FavouriteFoodsState extends State<FavouriteFoods> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> _foods = [];
  List<dynamic> favouriteFoodIds = [];
  bool isLoading = true;

  Future<List<String>> _fetchUserData() async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(userData!.email).get();
      if (snapshot.exists && snapshot.data() != null) {
        List<dynamic> ids = snapshot['favouriteFood'];
        return ids.cast<String>();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> _fetchFoods() async {
    favouriteFoodIds = await _fetchUserData();
    QuerySnapshot snapshots = await _firestore.collection('food').get();

    for (var doc in snapshots.docs) {
      var id = doc.id;
      if (favouriteFoodIds.contains(id)) {
        setState(() {
          _foods.add(doc);
        });
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: CustomAppBar(title: 'Favourites'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            Expanded(
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFFFA4A0C),
                        strokeWidth: 3,
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _foods.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot item = _foods[index];

                        return Padding(
                          padding: const EdgeInsets.only(top: 48.0, bottom: 15),
                          child: Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) async {
                              await _firestore
                                  .collection('users')
                                  .doc(userData!.email)
                                  .update({
                                'favouriteFood':
                                    FieldValue.arrayRemove([item.id])
                              }).then((_) {
                                setState(() {
                                  _foods.remove(item);
                                  userData!.favouriteFoods?.remove(item.id);
                                });
                              }).catchError((error) {
                                print("Failed to update user: $error");
                              });
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/foodInfo',
                                    arguments: item);
                              },
                              child: FoodCard(
                                foodLabel: item['name'],
                                imageUrl: item['image'],
                                price: item['price'],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
