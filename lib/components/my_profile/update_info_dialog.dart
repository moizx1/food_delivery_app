import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/common/custom_text_box.dart';
import 'package:food_delivery_app/constants/app_keys.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../constants/constants.dart';
import '../../model/user_model.dart';
import '../services/upload_image.dart';
import '../common/custom_button.dart';

class UpdateDialog extends StatelessWidget {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? firstName = userData!.firstName;
  String? lastName = userData!.lastName;
  bool isLoading = false;
  File? selectImage;
  UploadImage uploadImage = UploadImage();
  String? imageUrl;

  onEvent(BuildContext context) {
    showDialog(
      barrierDismissible: true,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        );
      },
      context: context,
    );
  }

  Expanded selectedImage() {
    if (selectImage != null) {
      return Expanded(
        child: Image.file(selectImage!),
      );
    } else if (userData!.imageUrl != null) {
      return Expanded(
        child: Image.network(userData!.imageUrl!),
      );
    } else {
      return Expanded(
        child: Image.network(
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor: Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          titlePadding: EdgeInsets.only(left: 0, right: 0, top: 0),
          // contentPadding:
          //     EdgeInsets.only(left: 0, right: 0, top: 0),
          title: Container(
            padding: EdgeInsets.only(left: 36, top: 17, right: 152, bottom: 20),
            decoration: BoxDecoration(
              color: Color(0xFFEDEDED),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
            ),
            child: Text(
              'Update',
              style: TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
          ),
          contentPadding:
              EdgeInsets.only(left: 22.5, right: 30, top: 0, bottom: 30),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black),
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: selectedImage())),
                          ),
                          Positioned(
                              bottom: 0,
                              right: -25,
                              child: ElevatedButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(40),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton.icon(
                                                onPressed: () async {
                                                  File? image = await uploadImage
                                                      .selectedImageCamera();
                                                  setState(() {
                                                    selectImage = image;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.camera,
                                                  size: 24.0,
                                                ),
                                                label: Text('Camera'),
                                              ),
                                              ElevatedButton.icon(
                                                onPressed: () async {
                                                  File? image = await uploadImage
                                                      .selectedImageGallery();
                                                  setState(() {
                                                    selectImage = image;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(
                                                  Icons.photo,
                                                  size: 24.0,
                                                ),
                                                label: Text('Gallery'),
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 2.0,
                                    // backgroundColor: Color(0xFFF5F6F9),
                                    shape: CircleBorder(),
                                    minimumSize: Size(30, 30)),
                                child: Icon(
                                  size: 15,
                                  IconData(0xe21a, fontFamily: 'MaterialIcons'),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextBox(
                          initialValue: firstName,
                          textLabel: 'First Name',
                          validateText: (value) {
                            return null;
                          },
                          onChange: (value) {
                            firstName = value;
                          },
                          isMargin: false,
                        ),
                        CustomTextBox(
                          initialValue: lastName,
                          textLabel: 'Last Name',
                          validateText: (value) {
                            return null;
                          },
                          onChange: (value) {
                            lastName = value;
                          },
                          isMargin: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          actionsPadding:
              EdgeInsets.only(left: 40, right: 0.0, bottom: 20, top: 20),
          actions: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w600,
                            fontSize: 17.0,
                            color: Color.fromARGB(255, 149, 149, 150)),
                      )),
                ),
                Expanded(
                    flex: 7,
                    child: CustomButton(
                      text: 'Proceed',
                      onPress: () async {
                        try {
                          setState(() {
                            isLoading = true;
                            isLoading == true ? onEvent(context) : null;
                          });
                          if (selectImage != null) {
                            String? url = await uploadImage.upload();

                            setState(() {
                              imageUrl = url;
                            });
                          }
                          UserModel model = UserModel(
                              email: userData!.email,
                              firstName: firstName,
                              lastName: lastName,
                              address: userData!.address,
                              imageUrl: (selectImage != null
                                  ? imageUrl
                                  : userData!.imageUrl));
                          await _firestore
                              .collection('users')
                              .doc(userData!.email)
                              .update({
                            if (selectImage != null) 'imageUrl': imageUrl,
                            'firstName': firstName,
                            'lastName': lastName
                          }).then((_) async {
                            getStorage.write(AppKey.userData, model.toJson());
                            final localData =
                                await getStorage.read(AppKey.userData);
                            userData = UserModel.fromJson(
                                localData as Map<String, dynamic>);
                            setState(() {
                              isLoading = false;
                              Navigator.pop(context);
                            });
                            Navigator.pop(context);
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    )),
              ],
            )
          ],
        );
      },
    );
  }
}
