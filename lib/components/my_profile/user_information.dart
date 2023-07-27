import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:food_delivery_app/components/my_profile/update_info_dialog.dart';
import 'package:food_delivery_app/components/services/upload_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:food_delivery_app/components/common/custom_appbar.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/common/custom_payment_options.dart';
import 'package:food_delivery_app/components/utils/ui_constants.dart';

import '../../constants/constants.dart';

class Information extends StatefulWidget {
  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  UploadImage uploadImage = UploadImage();

  Image selectedImage() {
    if (userData!.imageUrl != null) {
      print(userData?.imageUrl);
      return Image.network(userData!.imageUrl!);
    } else {
      return Image.network(
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png');
    }
  }

  String? groupValue = 'card';
  onRadioChange(value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: CustomAppBar(title: 'My profile'),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 37.0, right: 37.0, top: 0, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Information', style: profileLabelStyle),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 0,
              child: Container(
                padding: EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
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
                    SizedBox(width: 20.0),
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
                          SizedBox(height: 5.0),
                          Text(
                            userData!.address!,
                            maxLines: 3,
                            style: profileFieldStyle,
                          ),
                          SizedBox(height: 12.5),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return UpdateDialog();
                                  }).then((value) {
                                setState(() {});
                              });
                            },
                            child: Text(
                              'Update',
                              style: TextStyle(
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w400,
                                fontSize: 13.0,
                                color: Color(0xFFFA4A0C),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
            Text('Payment Method', style: profileLabelStyle),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    CustomListTile(
                      groupValue: groupValue,
                      onChange: onRadioChange,
                      value: 'card',
                      title: 'Card',
                      paymentBackground: Color(0xFFF47B0A),
                      paymentImage: 'assets/images/Card.png',
                      showIcon: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 28),
                      child: Divider(),
                    ),
                    CustomListTile(
                      groupValue: groupValue,
                      onChange: onRadioChange,
                      value: 'bank',
                      title: 'Bank',
                      paymentBackground: Color(0xFFEB4796),
                      paymentImage: 'assets/images/Bank.png',
                      showIcon: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70.0, right: 28),
                      child: Divider(),
                    ),
                    CustomListTile(
                      groupValue: groupValue,
                      onChange: onRadioChange,
                      value: 'paypal',
                      title: 'Paypal',
                      paymentBackground: Color(0xFF0038FF),
                      paymentImage: 'assets/images/PayPal.png',
                      showIcon: true,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Container(),
            ),
            Expanded(
              flex: 0,
              child: CustomButton(
                text: 'Update',
                isMargin: false,
                onPress: () => Navigator.pop(context, '/personalDetails'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
