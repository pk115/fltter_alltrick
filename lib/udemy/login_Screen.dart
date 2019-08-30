import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_alltrick/sqlite/utils/database_helper.dart';
import 'package:flutter_alltrick/udemy/udemylab_Page.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController ctrUserName = TextEditingController();
  TextEditingController ctrPassword = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  Future<Null> doLogin() async {
    final response = await http.post(
      'https://dotnetcore-webapi.herokuapp.com/api/jwt/CreateToken',
      body: {'User': ctrUserName.text, 'Password': ctrPassword.text},
    );

    var token = "";
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      print(jsonResponse['data']);
      token = jsonResponse['data'];
    }
//    final response = await http.get('http://10.2.13.11:5000/api/simple');
//    final response2 = await http.get('http://localhost:5000/api/Simple/Login',);

//    print(response.body);
    final _response = await http.post(
      'https://dotnetcore-webapi.herokuapp.com/api/user/login',
      headers: {'Authorization': 'Bearer ' + token},
      body: {'User': ctrUserName.text, 'Password': ctrPassword.text},
    );

    if (_response.statusCode == 200) {
      // print("200 Code True");
      var jsonResponse = json.decode(response.body);
      // print("Decode");
      print(jsonResponse['status']);
      if (jsonResponse['status']) //jsonResponse['ok']
      {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("Users", ctrUserName.text);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
//        showDialog<Null>(
//            context: context,
//            builder: (BuildContext context) {
//              return SimpleDialog(
//
//                title: const Text('Error'),
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal:20 ),
//                    child: Text("User Pass Fail",style: TextStyle(fontSize: 10),),
//                  ),
//                  SimpleDialogOption(
//                    onPressed: () { Navigator.pop(context); },
//                    child: const Text('ตกลง',style:TextStyle(color: Colors.red,fontSize: 30) ,),
//                  ),
//
//                ],
//              );
//            }
//        );

        _scaffoldkey.currentState.showSnackBar(new SnackBar(
            content: Row(
          children: <Widget>[
            //CircularProgressIndicator(),
            Text("Login Fail : UserName or Password :Missing"),
          ],
        )));
      }
      setState(() {
        // isLoading = false;
        //users = jsonResponse['results'];
      });
      //print(users);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  void doLoding() {
    print(ctrUserName.text);
    print(ctrPassword.text);
    if (ctrUserName.text == "a" && ctrPassword.text == "p") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  Future<Null> CheckUser() async {
    print("cr");
    DatabaseHelper db = DatabaseHelper.internal();
    db.initDatabase();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String User = await prefs.get("Users");
    if (User != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.pink,
          ),
          ListView(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Image(
                      width: 150,
                      height: 150,
                      image: AssetImage('assets/image/bg4.jpg'),
                    ),
                    // CircleAvatar(backgroundImage: AssetImage('assets/image/bg4.jpg'),),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Form(
                          child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: ctrUserName,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white70,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.red,
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: ctrPassword,
                            obscureText: true,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white70,
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.red,
                                ),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.black)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Material(
                            borderRadius:
                                BorderRadius.all(const Radius.circular(30)),
                            shadowColor: Colors.redAccent.shade100,
                            elevation: 5.0,
                            child: MaterialButton(
                              minWidth: 290.0,
                              height: 55.0,
                              onPressed: () => doLogin(),
                              color: Colors.black,
                              child: Text(
                                "LoginLoginLogin",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0.3),
                              ),
                            ),
                          ),
                          FlatButton(
                              onPressed: () {},
                              child: Text(
                                "Singin",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      )),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
