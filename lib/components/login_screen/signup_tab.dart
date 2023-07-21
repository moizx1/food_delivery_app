import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/constants/app_keys.dart';
import 'package:food_delivery_app/constants/constants.dart';
import 'package:food_delivery_app/model/user_model.dart';
import '../services/auth.dart';
import 'package:food_delivery_app/components/common/custom_text_box.dart';
import 'package:food_delivery_app/components/common/custom_button.dart';

class SignupTab extends StatefulWidget {
  @override
  State<SignupTab> createState() => _SignupTabState();
}

class _SignupTabState extends State<SignupTab> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  late String email, password, firstName, lastName, address;

  Future<bool> userExists(email) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then((value) => value.size > 0 ? true : false);
  }

  signUp() async {
    try {
      bool result = await userExists(email);
      if (result == true) {
        print('user already exists');
      } else {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((userCredential) async {
          UserModel signupModel = UserModel(
              email: email,
              firstName: firstName,
              lastName: lastName,
              address: address,
              imageUrl: null,
              favouriteFoods : null
              );
          await FirebaseFirestore.instance
              .collection("users")
              .doc(email)
              .set(signupModel.toJson()) // <-- Updated data
              .then((_) async {
            getStorage.write(AppKey.userData, signupModel.toJson());
            userData = await readUserData();
            await _auth.currentUser!.sendEmailVerification();
            Navigator.pushReplacementNamed(context, '/login');
          });
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The password provided is too weak.')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('The account already exists for that email.')));
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
      return null;
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
            padding: const EdgeInsets.all(10.0),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextBox(
                  onChange: (value) {
                    setState(() {
                      firstName = value;
                    });
                  },
                  textLabel: 'First Name',
                  validatorString: 'Enter your first name.',
                ),
              ),
              Expanded(
                child: CustomTextBox(
                  // validateText: ,
                  onChange: (value) {
                    setState(() {
                      lastName = value;
                    });
                  },
                  textLabel: 'Last Name',
                  validatorString: 'Enter your last name',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(7.5),
          ),
          CustomTextBox(
            validateText: isValidEmail,
            onChange: (value) {
              setState(() {
                email = value;
              });
            },
            textLabel: 'Email Address',
            validatorString: 'Enter valid email',
            textType: TextInputType.emailAddress,
          ),
          Padding(
            padding: const EdgeInsets.all(7.5),
          ),
          CustomTextBox(
            validateText: isValidPassword,
            onChange: (value) {
              setState(() {
                password = value;
              });
            },
            visibleText: true,
            textLabel: 'Password',
            validatorString: 'Enter valid password',
          ),
          Padding(
            padding: const EdgeInsets.all(7.5),
          ),
          CustomTextBox(
            // validateText: ,
            onChange: (value) {
              setState(() {
                address = value;
              });
            },
            textLabel: 'Address',
            validatorString: 'Please enter address',
          ),
          Padding(
            padding: const EdgeInsets.all(7.5),
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
            padding: const EdgeInsets.all(10),
          ),
          CustomButton(
            text: 'Register',
            onPress: () {
              if (_formKey.currentState!.validate()) {
                signUp();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(7.5),
          ),
        ],
      ),
    );
  }
}
