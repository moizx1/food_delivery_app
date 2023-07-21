import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class UploadImage {
  String? imageUrl;
  XFile? image;
  late File selectedImage;
  late File imagePath;
  PermissionStatus? permissionStatus;

  Future<String> upload() async {
    String? downloadUrl;
    permissionStatus = await Permission.photos.status;
    if (permissionStatus!.isGranted) {
      imagePath = File(selectedImage.path);
      final fileName = basename(imagePath.path);
      try {
        final reference = FirebaseStorage.instance
            .ref()
            .child('users/profile_images/$fileName');
        await reference.putFile(imagePath).whenComplete(() async {
          downloadUrl = await reference.getDownloadURL();
          print(downloadUrl);
          return downloadUrl;
        });
      } catch (e) {
        print(e);
      }
      return downloadUrl ??
          'Permission not granted. Try Again with permission access';
      
    }
    return downloadUrl ??
        'Permission not granted. Try Again with permission access';
  }

  Future<File?> selectedImageGallery() async {
    if (permissionStatus == null) {
      await Permission.photos.request();
    }
    permissionStatus = await Permission.photos.status;
    if (permissionStatus!.isGranted) {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
      selectedImage = File(image!.path);

      if (image != null) {
        final path = cropImage(selectedImage);
        return path;
      }
    }
    return null;
  }

  Future<File?> selectedImageCamera() async {
    if (permissionStatus == null) {
      await Permission.photos.request();
    }
    permissionStatus = await Permission.photos.status;
    if (permissionStatus!.isGranted) {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
      selectedImage = File(image!.path);

      if (image != null) {
        // return selectedImage;
        final path = await cropImage(selectedImage);
        return path;
      }
    }
    return null;
  }

  // Crop Image
  Future<File?> cropImage(File filePath) async {
    CroppedFile? image = await ImageCropper().cropImage(
      sourcePath: filePath.path,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    final File? croppedImage = File(image!.path);
    if (croppedImage != null) {
      return croppedImage;
    }
    return null;
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
}
