import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/services/upload_image.dart';

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late String imageUrl =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Image.network(imageUrl),
          IconButton(
            onPressed: () async {
              // String url = await UploadImage().imageFromGallery();
              setState(() {
                // imageUrl = url;
              });
            },
            icon: Icon(Icons.upload),
          )
        ],
      ),
    );
  }
}
