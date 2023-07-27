import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/food_model.dart';
import '../checkout/slidableListTile.dart';
import '../utils/ui_constants.dart';
import 'counter.dart';

class CartItem extends StatelessWidget {
  CartItem(
      {
      required this.onDelete,
      required this.onFavouritePress,
      required this.updateQuantity,
      required this.item});
  final onFavouritePress,onDelete;
  final void Function(int) updateQuantity;
  final FoodModel? item;

  @override
  Widget build(BuildContext context) {
    return SlidableListTile(
      onFavouritePress: onFavouritePress,
      onDelete: onDelete,
      child: GestureDetector(
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
                child: Image.network(item!.imageUrl!, scale: 6),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      item!.foodName!,
                      style: appBarTextStyle,
                    ),
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rs ${item!.price! * (item!.quantity!)}',
                          style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                            color: Color(0xFFFA4A0C),
                          ),
                        ),
                        Counter(
                          quantity: item!.quantity!,
                          updateQuantity: updateQuantity,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
