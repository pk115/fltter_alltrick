import 'package:flutter/material.dart';
class ListView3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView EP3",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView EP3"),
        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[Container(
            alignment: FractionalOffset.center,
            width: 150,
            color: Colors.pink,
            child: Text("A",style: TextStyle(fontSize: 100,color: Colors.white),),
          ),Container(
            alignment: FractionalOffset.center,
            width: 150,
            color: Colors.green,
            child: Text("B",style: TextStyle(fontSize: 100,color: Colors.white),),
          ),Container(
            alignment: FractionalOffset.center,
            width: 150,
            color: Colors.blueAccent,
            child: Text("C",style: TextStyle(fontSize: 100,color: Colors.white),),
          ),Container(
            alignment: FractionalOffset.center,
            width: 150,
            color: Colors.yellow,
            child: Text("D",style: TextStyle(fontSize: 100,color: Colors.white),),
          ),Container(
            alignment: FractionalOffset.center,
            width: 150,
            color: Colors.black,
            child: Text("E",style: TextStyle(fontSize: 100,color: Colors.white),),
          ),],
        ),
      ),
    );
  }
}
