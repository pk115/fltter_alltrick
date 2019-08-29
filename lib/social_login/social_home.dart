import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_alltrick/social_login/social_login_Page.dart';
import 'package:flutter_alltrick/models/user.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
  ],
);

class HomePage extends StatefulWidget {
  User userInfo;

  HomePage(this.userInfo);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  Future<Null> _handleSignOut() async {
    print("step 1");

    if (widget.userInfo.loginwith == "google") {
      await _googleSignIn.disconnect();
    } else if (widget.userInfo.loginwith == "facebook") {
      await facebookSignIn.logOut();
    }
    print("step End");
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SocialLoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าหลัก'),
      ),
      body: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(widget.userInfo.photoUrl),
        ),
        title: Text(widget.userInfo.displayName),
        subtitle: Text(widget.userInfo.email),
        trailing: IconButton(
            icon: Icon(Icons.exit_to_app), onPressed: () => _handleSignOut()),
      ),
    );
  }
}
