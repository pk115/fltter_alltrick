import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget {
  @override
  _SingInPageState createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
      ),
      body: Center(
        child: Text(
          "SingIn Page",
          style: TextStyle(fontSize: 45.0, color: Colors.black12),
        ),
      ),
    );
  }
}
