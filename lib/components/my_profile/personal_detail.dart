import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/components/common/custom_appbar.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/common/custom_payment_options.dart';
import 'package:food_delivery_app/components/utils/ui_constants.dart';

import '../../constants/constants.dart';
import '../common/profileInfo.dart';

class PersonalDetails extends StatelessWidget {
  Image selectedImage() {
    if (userData!.imageUrl != null) {
      print(userData?.imageUrl);
      return Image.network(userData!.imageUrl!);
    } else {
      return Image.network(
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: CustomAppBar(),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 37.0, right: 37.0, top: 0, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 0,
              child: Text('My Profile',
                  style: TextStyle(
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                    fontSize: 34.0,
                    color: Colors.black,
                  )),
            ),
            Expanded(flex: 3, child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(' Personal Details', style: profileLabelStyle),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/information'),
                  child: Text(
                    'change  ',
                    style: TextStyle(
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                        color: Color(0xFFFA4A0C)),
                  ),
                )
              ],
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 0,
              child: Container(
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 25.0, left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black),
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: selectedImage())),
                    SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${userData!.firstName!} ${userData!.lastName!}',
                              style: profileNameStyle),
                          SizedBox(height: 3.0),
                          Text(
                            userData!.email!,
                            style: profileFieldStyle,
                          ),
                          Divider(),
                          Text(
                            '+234 9011039271',
                            style: profileFieldStyle,
                          ),
                          Divider(),
                          // SizedBox(height: 5.0),
                          Text(
                            userData!.address ?? '',
                            maxLines: 3,
                            style: profileFieldStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 4, child: Container()),
            GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/orders'),
                child: ProfileInfo(title: 'Orders')),
            Expanded(flex: 3, child: Container()),
            ProfileInfo(title: 'Pending reviews'),
            Expanded(flex: 3, child: Container()),
            ProfileInfo(title: 'Faq'),
            Expanded(flex: 3, child: Container()),
            ProfileInfo(title: 'Help'),
            Expanded(flex: 7, child: Container()),
            Expanded(
              flex: 0,
              child: CustomButton(
                text: 'Update',
                isMargin: false,
                onPress: () => Navigator.pushNamed(context, '/home'),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
