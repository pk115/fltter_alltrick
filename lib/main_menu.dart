import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alltrick/callwidget/widget/button.dart';
import 'package:flutter_alltrick/map_location/geolocator.dart';
import 'package:flutter_alltrick/other/camera_page.dart';
import 'package:flutter_alltrick/sample_layout/DesigeFlutter.dart';
import 'package:flutter_alltrick/sample_layout/Intrinsicwh_page.dart';
import 'package:flutter_alltrick/sample_layout/expanded_page.dart';
import 'package:flutter_alltrick/sample_layout/gridview1_page.dart';
import 'package:flutter_alltrick/sample_layout/listview1_page.dart';
import 'package:flutter_alltrick/sample_layout/listview2_page.dart';
import 'package:flutter_alltrick/sample_layout/listview3_page.dart';
import 'package:flutter_alltrick/sample_layout/listview4_page.dart';
import 'package:flutter_alltrick/sample_layout/rowandcolum_page.dart';
import 'package:flutter_alltrick/sample_layout/sizebox_page.dart';
import 'package:flutter_alltrick/sample_layout/stacklayout_page.dart';
import 'package:flutter_alltrick/social_login/social_login_Page.dart';
import 'package:flutter_alltrick/sqlite/member_screen.dart';
import 'package:flutter_alltrick/udemy/login_Screen.dart';
import 'package:flutter_alltrick/udemy/udemylab_Page.dart';

import 'desing/loginapp/login_page.dart';
import 'map_location/mapbox.dart';
import 'other/barcode_QR_Page.dart';
import 'other/signature_page.dart';
import 'other/webview_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Sample layout",
                          style: TextStyle(fontSize: 20),
                        ),
                        buildRaisedButton('List View 1',
                            onPressed: () => golistview1(),
                            buttoncolor: Colors.blueAccent),
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
                          onPressed: () => golistview3(),
                          color: Colors.blueAccent,
                          child: Text("List View 3",
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

                        buildRaisedButton('Rows & Colums', onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Row_Colum()));
                        }, buttoncolor: Colors.orange),

//                        RaisedButton(
//                          onPressed: () => {},
//                          color: Colors.pink,
//                          child: Text("font",
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 20.0,
//                                  fontWeight: FontWeight.bold)),
//                        ),
//                        RaisedButton(
//                          onPressed: () => {},
//                          color: Colors.deepOrangeAccent,
//                          child: Text("iconimage iconfont",
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 20.0,
//                                  fontWeight: FontWeight.bold)),
//                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "DesigePage",
                          style: TextStyle(fontSize: 20),
                        ),
                        RaisedButton(
                            onPressed: () => gologin(),
                            color: Colors.pink,
                            child: Text("Login  Page",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                        RaisedButton(
                          onPressed: () => gologin2(),
                          color: Colors.brown,
                          child: Text("login 2",
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
                          onPressed: () => goHomeScreen(),
                          color: Colors.deepPurpleAccent,
                          child: Text("Udemy Tutorial",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Data & http",
                          style: TextStyle(fontSize: 20),
                        ),
                        RaisedButton(
                          onPressed: () => SQLite(),
                          color: Colors.brown,
                          child: Text("SQLite",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        RaisedButton(
                          onPressed: () => gologin2(),
                          color: Colors.deepPurpleAccent,
                          child: Text("httpPost",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Camera & ScanQR ",
                          style: TextStyle(fontSize: 20),
                        ),
                        RaisedButton(
                          onPressed: () => Camera(),
                          color: Colors.deepPurpleAccent,
                          child: Text("Camera",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        buildRaisedButton('QR & Barcode', onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BarcodePage()));
                        }, buttoncolor: Colors.orange),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Map & Location",
                          style: TextStyle(fontSize: 20),
                        ),
                        RaisedButton(
                          onPressed: () => getlocation(),
                          color: Colors.red,
                          child: Text("Get Location",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
//                        RaisedButton(
//                          onPressed: () => Gobggolocation(),
//                          color: Colors.red,
//                          child: Text("background geolocation",
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 20.0,
//                                  fontWeight: FontWeight.bold)),
//                        ),
//                        RaisedButton(
//                          onPressed: () => GoMapBox(),
//                          color: Colors.red,
//                          child: Text("MapBoxPage",
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: 20.0,
//                                  fontWeight: FontWeight.bold)),
//                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "other",
                          style: TextStyle(fontSize: 20),
                        ),
                        RaisedButton(
                          onPressed: () => facebook_google_Login(),
                          color: Colors.deepPurpleAccent,
                          child: Text("Soial Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                        buildApplicationButton('Signature Pad', onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignaturePage()));
                        }),
                        buildRaisedButton('Web View', onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebViewPage()));
                        }, buttoncolor: Colors.orange),
                        buildApplicationButton('Test Call Widget',
                            onPressed: () {}),
                        buildRaisedButton('Test Call Widget',
                            onPressed: () {}, buttoncolor: Colors.orange)
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Card",
                          style: TextStyle(fontSize: 20),
                        ),
                        RaisedButton(
                          onPressed: () => {},
                          color: Colors.deepPurpleAccent,
                          child: Text("botton",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
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

  Future QR_Barcode() async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => QR_BarcodePage()));
  }
  Future Camera() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CameraPage()));
  }

  Future SQLite() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MemberScreen()));
  }

  Future Gobggolocation() async {
//    Navigator.push(
//        context, MaterialPageRoute(builder: (context) => AdvancedApp()));
  }

  Future GoMapBox() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MapBoxPage()));
  }
}
