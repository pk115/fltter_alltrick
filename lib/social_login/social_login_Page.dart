import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_alltrick/controllers/auth.dart';
import 'package:flutter_alltrick/social_login/social_home.dart';
import 'package:flutter_alltrick/models/user.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:http/http.dart' as http;

GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class SocialLoginPage extends StatefulWidget {
  @override
  _SocialLoginPageState createState() => _SocialLoginPageState();
}

class _SocialLoginPageState extends State<SocialLoginPage> {
  GoogleSignInAccount _currentUser;
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  Future<Null> _facebookLogin() async {
    print("step 1");
    final FacebookLoginResult result =
        await facebookSignIn.logInWithReadPermissions(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        print(accessToken.token);
        await getFacebookInfo(accessToken.token);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<Null> GoogleAuth() async {
    User user = User();
    GoogleLogin googleLogin = GoogleLogin();
    print("Call GoogleLogin Class");
    user = await googleLogin.handleSignIn();
    print("Call Complete");
//    print(user.displayName);
    String Username = user.displayName;
    print("Username : $Username ");
    if (user.id != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage(user)));
    }
  }

  Future<Null> _handleSignIn() async {
    try {
      print("google connect");
      _currentUser = await _googleSignIn.signIn();
      print("google return");
      print("insert value return");
      User user = User();
      user.displayName = _currentUser.displayName;
      user.email = _currentUser.email;
      user.photoUrl = _currentUser.photoUrl;
      print("insert complete");
      print(_currentUser);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage(user)));
    } catch (error) {
      print(error);
    }
  }

  Future getFacebookInfo(token) async {
    print("step 2");
    String url =
        'https://graph.facebook.com/v2.8/me?fields=picture.type(large),email,first_name,last_name&access_token=$token';
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        User user = User();
        user.displayName =
            '${jsonResponse['first_name']} ${jsonResponse['last_name']}';
        user.email = jsonResponse['email'];
        user.photoUrl = jsonResponse['picture']['data']['url'];
        user.loginwith = "facebook";
        print(user);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage(user)));
      } else {
        print('Connection error!!');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Application'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton.icon(
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () => GoogleAuth(), //_handleSignIn(),
                        icon: Icon(IconData(0xea8a, fontFamily: 'icomoon')),
                        label: Text('Google signin')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton.icon(
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () => _facebookLogin(),
                        icon: Icon(IconData(0xea91, fontFamily: 'icomoon')),
                        label: Text('Facebook signin')),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
