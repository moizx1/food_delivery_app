import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shimmer/shimmer.dart';

class FoodCard extends StatelessWidget {
  FoodCard(
      {required this.imageUrl, required this.foodLabel, required this.price});
  final String imageUrl, foodLabel;
  final int price;

  Widget imageShimmer() {
    return Expanded(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(70),
          child: Container(
            height: 140,
            width: 140,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        child: Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                height: 270,
                width: 220,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    Text(
                      foodLabel,
                      style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                        fontSize: 22.0,
                      ),
                    ),
                    // Text(
                    //   'tomato mix',
                    //   style: TextStyle(
                    //     fontFamily: 'SF Pro',
                    //     fontWeight: FontWeight.w600,
                    //     fontSize: 22.0,
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Rs ${price.toString()}',
                      style: TextStyle(
                        color: Color(0xFFFA4A0C),
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: -37.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image.network(
                    imageUrl,
                    height: 140,
                    width: 140,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
