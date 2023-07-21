import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/components/common/custom_text_box.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';
import 'package:food_delivery_app/constants/constants.dart';
import '../../constants/app_keys.dart';
import '../../model/user_model.dart';
import '../services/auth.dart';
import '../utils/ui_constants.dart';

class LoginTab extends StatefulWidget {
  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final _auth = FirebaseAuth.instance;
  late User user;
  final _fireStore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  String? email, password;
  bool isPressed = false;

  Future<void> resetPassword({required String email}) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  signIn() async {
    try {
      // Sign in with email and password
      await _auth
          .signInWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((userCredential) async {
        user = userCredential.user!;
        if (user.emailVerified) {
          String userId = userCredential.user!.email!;
          // Retrieve user data from Firestore
          DocumentSnapshot userDoc =
              await _fireStore.collection('users').doc(userId).get();
          UserModel signInModel = UserModel(
              email: userId,
              firstName: userDoc['firstName'],
              lastName: userDoc['lastName'],
              address: userDoc['address'],
              imageUrl: userDoc['imageUrl'],
              favouriteFoods : userDoc['favouriteFood']
              );

          getStorage.write(AppKey.userData, signInModel.toJson());
          userData = signInModel;
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text('Please verify your email'),
                actions: [
                  TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            },
          );
        }
      }).catchError((error) {
        // AlertDialog(title: Text('Error'), content: Text(error));
        print(error);
      });
    } catch (e) {
      print(e);
    }
  }

  String? isValidEmail(email) {
    // Use a regular expression to validate the email format
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    if (!emailRegex.hasMatch(email)) {
      return 'Provide valid email';
    }
    return null;
  }

  String? isValidPassword(password) {
    if (password.length < 6) {
      return 'Password should be greater than 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
          ),
          CustomTextBox(
            onChange: (value) {
              email = value;
            },
            textLabel: 'Email Address',
            validatorString: 'Enter a valid email',
            validateText: isValidEmail,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
          ),
          CustomTextBox(
            onChange: (value) {
              password = value;
            },
            visibleText: true,
            textLabel: 'Password',
            validatorString: 'Enter a valid password',
            validateText: isValidPassword,
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0),
            child: TextButton(
              child: Text('Forgot passcode?', style: forgotTextStyle),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Reset Password'),
                      content: CustomTextBox(
                        textLabel: 'Enter Email',
                        initialValue: email,
                        onChange: (value) {
                          email = value;
                        },
                        validatorString: 'Enter a valid email',
                        validateText: isValidEmail,
                      ),
                      actions: [
                        isPressed == true
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () async {
                                  isPressed = true;
                                  await resetPassword(email: email ?? '');
                                  isPressed = false;
                                  Navigator.pop(context);
                                },
                                child: Text('Send'),
                              ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
          ),
          ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStatePropertyAll(0),
              backgroundColor: MaterialStatePropertyAll(Color(0xFFF2F2F2)),
            ),
            onPressed: () async {
              try {
                await AuthService().signInWithGoogle();
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              } catch (e) {
                print(e);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/google.png',
                  scale: 8,
                ),
                SizedBox(width: 7.5),
                Text(
                  'Sign-In with Google',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
          ),
          CustomButton(
            text: 'Login',
            onPress: () {
              if (_formKey.currentState!.validate()) {
                signIn();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
          ),
        ],
      ),
    );
  }
}
