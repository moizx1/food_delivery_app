import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/home_screen/home_screen.dart';
import 'package:food_delivery_app/components/login_screen/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Determine if the user is authenticated.
  // handleAuthState() {
  //   return StreamBuilder(
  //       stream: FirebaseAuth.instance.authStateChanges(),
  //       builder: (BuildContext context, snapshot) {
  //         if (snapshot.hasData) {
  //           return HomeScreen();
  //         } else {
  //           return LoginScreen();
  //         }
  //       });
  // }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //Sign out
  Future<void> googleSignOut() async {
    // await GoogleUser.signOut();
    await GoogleSignIn().disconnect();
  }
  Future<void> firebaseSignOut() async {
    // await GoogleUser.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
