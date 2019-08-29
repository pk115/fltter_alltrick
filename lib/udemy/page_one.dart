import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(child: Image(fit: BoxFit.fill,image: AssetImage("assets/image/bg3.jpg")),),
        SizedBox(
        height: 20,),
        Card(child: Image(image: AssetImage("assets/image/bg3.jpg")),),
      ],
    );
  }
}