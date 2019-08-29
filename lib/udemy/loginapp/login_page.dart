import 'package:flutter/material.dart';


import 'package:flutter_alltrick/udemy/loginapp/home_page.dart';
import 'package:flutter_alltrick/udemy/loginapp/singin_Page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController ctrUsername = TextEditingController();
  TextEditingController ctrPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            //color: Colors.amberAccent,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image/bg4.jpg'))),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) return "กรอก Username";
                    },
                    controller: ctrUsername,
                    decoration: InputDecoration(
                        //errorStyle: TextStyle(fontSize: 5.0),
                        prefixIcon: Icon(Icons.supervised_user_circle),
                        labelText: "UserName",
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 20.0),
                        filled: true,
                        fillColor: Colors.black12,
                        border: InputBorder.none),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) return "กรอก Password";
                    },
                    controller: ctrPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        //errorStyle: TextStyle(fontSize: 5.0),
                        prefixIcon: Icon(Icons.lock),
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 20.0),
                        filled: true,
                        fillColor: Colors.black12,
                        border: InputBorder.none),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () => dologin(),
                        color: Colors.pink,
                        child: Text("Login  ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      ),
                      RaisedButton(
                        onPressed: () => dosingin(),
                        color: Colors.blueAccent,
                        child: Text("Singin",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  //FlatButton(onPressed: (){}, child: Text("More",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold,fontSize: 10.0))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  dologin() {
    if (_formKey.currentState.validate()) {
      String username = ctrUsername.text;
      String password = ctrPassword.text;
      //print(username+' '+password);
      if (username == "admin" && password == "pass") {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        print("Fail");
      }
    }
  }

  dosingin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SingInPage()));

  }
}
