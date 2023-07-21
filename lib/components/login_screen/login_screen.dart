import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/login_screen/top_screen.dart';
import 'package:food_delivery_app/components/common/custom_text_box.dart';
import './login_tab.dart';
import './signup_tab.dart';
import '../utils/ui_constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TopScreen(),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[LoginTab(), SignupTab()],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
