import 'package:flutter_slidable_panel/flutter_slidable_panel.dart';
import 'package:food_delivery_app/model/order_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/checkout/slidableListTile.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/common/cart_item.dart';
import 'package:food_delivery_app/constants/constants.dart';
import 'package:food_delivery_app/model/food_model.dart';
import '../common/custom_appbar.dart';
import '../utils/ui_constants.dart';

class Cart extends StatefulWidget {
  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<FoodModel> cartList = [];

  bool isLoading = true;
  final BorderRadius borderRadius = BorderRadius.circular(30.0);

  void updateQuantity(int index, int newQuantity) {
    setState(() {
      cartList[index].quantity = newQuantity;
    });
  }

  Future<void> onDelete(index, foodId) async {
    await _firestore
        .collection('users')
        .doc(userData!.email)
        .collection('cart')
        .doc(foodId)
        .delete()
        .then((_) {
      setState(() {
        cartList.removeAt(index);
        print(cartList.length);
      });
    });
  }

  Future<void> onFavouritePress(foodId) async {
    try {
      if (userData != null &&
          userData!.favouriteFoods != null &&
          !(userData!.favouriteFoods!.contains(foodId))) {
        await _firestore.collection('users').doc(userData!.email).update({
          'favouriteFood': FieldValue.arrayUnion([foodId])
        }).then((_) {
          // setState(() {
          userData!.favouriteFoods?.add(foodId);
          // });
        }).catchError((error) {
          print("Failed to update user: $error");
        });
      } else {
        await _firestore.collection('users').doc(userData!.email).update({
          'favouriteFood': FieldValue.arrayRemove([foodId])
        }).then((_) {
          setState(() {
            userData!.favouriteFoods?.remove(foodId);
          });
        }).catchError((error) {
          print("Failed to update user: $error");
        });
      }
      // setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Widget buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        margin: EdgeInsets.only(left: 24, right: 24, top: 24),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Row(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '',
                    style: appBarTextStyle,
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w600,
                          fontSize: 15.0,
                          color: Color(0xFFFA4A0C),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future fetchFromUser() async {
    await _firestore.collection('food').get().then((foodDocs) async {
      await _firestore
          .collection('users')
          .doc(userData!.email)
          .collection('cart')
          .get()
          .then((cartDocs) async {
        for (var cartDoc in cartDocs.docs) {
          for (var doc in foodDocs.docs) {
            if (doc.id == cartDoc.id) {
              Map data = doc.data();

              cartList.add(FoodModel(
                foodId: doc.id,
                imageUrl: data['image'],
                foodName: data['name'],
                price: data['price'],
                quantity: 1,
              ));
            }
          }
        }
      });
    });
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchFromUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: CustomAppBar(title: 'Cart'),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/swipe.png'),
              Text(
                'swipe on an item to delete',
                style: profileNameStyle,
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: isLoading ? 4 : cartList.length,
              itemBuilder: (context, index) {
                return isLoading
                    ? buildShimmer()
                    : CartItem(
                        item: cartList[index],
                        onDelete: () => onDelete(index, cartList[index].foodId),
                        onFavouritePress: () async {
                          // print('onTap');
                          await onFavouritePress(cartList[index].foodId);
                        },
                        updateQuantity: (newQuantity) {
                          updateQuantity(index, newQuantity);
                        },
                      );
              },
            ),
          ),
          SizedBox(height: 30),
          CustomButton(
            text: 'Complete Order',
            onPress: () {

              Navigator.pushNamed(context, '/delivery', arguments: cartList);
            },
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
