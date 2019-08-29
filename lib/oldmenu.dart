//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alltrick/cmdev/rowandcolum_page.dart';
import 'package:flutter_alltrick/cmdev/sizebox_page.dart';
import 'package:flutter_alltrick/cmdev/stacklayout_page.dart';
import 'package:flutter_alltrick/map_location/geolocator.dart';
import 'package:flutter_alltrick/social_login/social_login_Page.dart';
import 'package:flutter_alltrick/udemy/login_Screen.dart';
import 'package:flutter_alltrick/udemy/loginapp/login_page.dart';
import 'package:flutter_alltrick/udemy/udemylab_Page.dart';

import 'cmdev/DesigeFlutter.dart';
import 'cmdev/Intrinsicwh_page.dart';
import 'cmdev/expanded_page.dart';
import 'cmdev/gridview1_page.dart';
import 'cmdev/listview1_page.dart';
import 'cmdev/listview2_page.dart';
import 'cmdev/listview3_page.dart';
import 'cmdev/listview4_page.dart';

class OldMainPage extends StatefulWidget {
  @override
  _OldMainPageState createState() => _OldMainPageState();
}

class _OldMainPageState extends State<OldMainPage> {
//  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//  @override
//  void initState() {
//    super.initState();
//    _firebaseMessaging.getToken().then((token) {
//      print(token);
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Tutorial Excample"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RaisedButton(
                            onPressed: () => gologin(),
                            color: Colors.pink,
                            child: Text("Login  Page",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                        RaisedButton(
                          onPressed: () => golistview1(),
                          color: Colors.blueAccent,
                          child: Text("List View 1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => golistview3(),
                          color: Colors.blueAccent,
                          child: Text("List View 3",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => gogridview1(),
                          color: Colors.green,
                          child: Text("Grid View 1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goExpanded(),
                          color: Colors.amber,
                          child: Text("Expanded",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goIntrinsicWH(),
                          color: Colors.deepPurpleAccent,
                          child: Text("Intrinsic W H",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goHomeScreen(),
                          color: Colors.deepPurpleAccent,
                          child: Text("Udemy Tutorial",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => facebook_google_Login(),
                          color: Colors.deepPurpleAccent,
                          child: Text("Google Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goIntrinsicWH(),
                          color: Colors.deepPurpleAccent,
                          child: Text("AAA",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goIntrinsicWH(),
                          color: Colors.deepPurpleAccent,
                          child: Text("AAA",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goIntrinsicWH(),
                          color: Colors.deepPurpleAccent,
                          child: Text("AAA",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goIntrinsicWH(),
                          color: Colors.deepPurpleAccent,
                          child: Text("AAA",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goIntrinsicWH(),
                          color: Colors.deepPurpleAccent,
                          child: Text("AAA",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () => goRowColum(),
                          color: Colors.pink,
                          child: Text("Rows & Colums",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => golistview2(),
                          color: Colors.blueAccent,
                          child: Text("List View 2",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => golistview4(),
                          color: Colors.blueAccent,
                          child: Text("List View 4",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => gostack(),
                          color: Colors.brown,
                          child: Text("Stack Layout",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goSizedBox1(),
                          color: Colors.deepOrangeAccent,
                          child: Text("SizedBox",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goDesingApp(),
                          color: Colors.red,
                          child: Text("Desing Page",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => gologin2(),
                          color: Colors.red,
                          child: Text("login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => getlocation(),
                          color: Colors.red,
                          child: Text("Location",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goDesingApp(),
                          color: Colors.red,
                          child: Text("BBB",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goDesingApp(),
                          color: Colors.red,
                          child: Text("BBB",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goDesingApp(),
                          color: Colors.red,
                          child: Text("BBB",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goDesingApp(),
                          color: Colors.red,
                          child: Text("BBB",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => goDesingApp(),
                          color: Colors.red,
                          child: Text("BBB",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            ],
          )),
    );
  }

  gologin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  goRowColum() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Row_Colum()));
  }

  golistview1() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListView1()));
  }

  golistview2() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListView2()));
  }

  golistview3() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListView3()));
  }

  golistview4() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListView4()));
  }

  gogridview1() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GridView1()));
  }

  gostack() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StaclLayout()));
  }

  goExpanded() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ExpandedPage()));
  }

  goSizedBox1() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SizeBoxPage()));
  }

  goIntrinsicWH() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => IntrinsicWHPage()));
  }

  goDesingApp() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DesingApp()));
  }

  goHomeScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  gologin2() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  facebook_google_Login() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SocialLoginPage()));
  }

  Future getlocation() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GeolocatorPage()));
  }
}
