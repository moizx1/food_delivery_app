import 'package:food_delivery_app/model/user_model.dart';
import 'package:get_storage/get_storage.dart';

import 'app_keys.dart';

final getStorage = GetStorage();
UserModel? userData;
String? profilePicture;

Future readUserData() async {
  final localData = await getStorage.read(AppKey.userData);
  if (localData != null) {
    return userData = UserModel.fromJson(localData as Map<String, dynamic>);
  } else {
    return null;
  }
}
