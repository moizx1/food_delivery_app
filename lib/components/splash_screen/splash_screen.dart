import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/components/splash_screen/logo.dart';
import 'package:food_delivery_app/components/splash_screen/splash_text.dart';

import '../../constants/app_keys.dart';
import '../../constants/constants.dart';
import '../../model/user_model.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF4B3A),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 2,
                child: LogoImage(),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 45.0,
                  ),
                  child: SplashText('Food for'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 45.0,
                  ),
                  child: SplashText('Everyone'),
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(),
              ),
              Expanded(
                flex: 13,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 0,
                      bottom: 50.0,
                      child: Image.asset('assets/images/ToyFaces2.png'),
                    ),
                    Positioned(
                      top: 10.0,
                      left: 0.0,
                      bottom: 50.0,
                      child: Image.asset(
                        'assets/images/ToyFaces1.png',
                        // opacity: const AlwaysStoppedAnimation(.5),
                      ),
                    ),
                    Positioned(
                      height: 250,
                      bottom: 0.0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Color(0xFFFF460A),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0, 0.95],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: CustomButton(
                          text: 'Get Started',
                          textColor: Color(0xFFFF460A),
                          backColor: Colors.white,
                          onPress: () async {
                            userData = await readUserData();
                            if (userData != null) {
                              print(userData!.favouriteFoods);
                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              Navigator.pushReplacementNamed(context, '/login');
                            }
                          }),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFFFF460A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
