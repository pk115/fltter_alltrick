import 'package:flutter/material.dart';
import 'package:flutter_alltrick/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleLogin {
  GoogleSignIn _googleSignIn = new GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  GoogleSignInAccount _currentUser;

  Future<User> handleSignIn() async {
    try {
      print("google connect");
      _currentUser = await _googleSignIn.signIn();
      print("google return");
//      print(_currentUser);
      print("insert value return");
      User user = User();
      user.id = _currentUser.id;
      user.displayName = _currentUser.displayName;
      user.email = _currentUser.email;
      user.photoUrl = _currentUser.photoUrl;
      user.loginwith = "google";
      print("insert complete");

      return user;
//    Navigator.of(context).pushReplacement(
//        MaterialPageRoute(builder: (context) => HomePage(user)));
    } catch (error) {
      return null;
      print(error);
    }
  }
}
