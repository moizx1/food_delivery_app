import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/favourite_foods/favourite_foods.dart';
import 'package:get_storage/get_storage.dart';
import 'package:food_delivery_app/components/checkout/cart.dart';
import 'package:food_delivery_app/components/checkout/delivery_screen.dart';
import 'package:food_delivery_app/components/common/myOffers.dart';
import 'package:food_delivery_app/components/common/no_history.dart';
import 'package:food_delivery_app/components/common/cart_item.dart';
import 'package:food_delivery_app/components/food_info/food_info.dart';
import 'package:food_delivery_app/components/home_screen/home_screen.dart';
import 'package:food_delivery_app/components/home_screen/search_results.dart';
import 'package:food_delivery_app/components/my_profile/user_information.dart';
import 'package:food_delivery_app/components/splash_screen/splash_screen.dart';
import 'package:food_delivery_app/components/login_screen/login_screen.dart';
import 'package:food_delivery_app/components/services/upload_image.dart';
import 'components/checkout/payment_screen.dart';
import 'components/common/counter.dart';
import 'components/common/food_card.dart';
import 'components/common/noConnection.dart';
import 'components/common/no_orders.dart';
import 'components/my_profile/personal_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: SplashScreen(),
      initialRoute: '/',
      routes: {
        // '/': (context) => MyWidget(),
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/personalDetails': (context) => PersonalDetails(),
        '/information': (context) => Information(),
        '/history': (context) => NoHistory(),
        // '/results': (context) => SearchResults(),
        '/foodInfo': (context) => FoodInfo(),
        '/favouriteFoods': (context) => FavouriteFoods(),
        '/orders': (context) => NoOrders(),
        '/cart': (context) => Cart(),
        '/payment': (context) => PaymentScreen(arguments: ModalRoute.of(context)!.settings.arguments,),
        '/delivery': (context) => DeliveryScreen(),
      },
    );
  }
}

