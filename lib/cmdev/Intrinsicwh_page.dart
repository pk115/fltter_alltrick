import 'package:flutter/material.dart';

class IntrinsicWHPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Intrinsic W H Page",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Intrinsic WH Page"),
        ),
        body: Center(
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _buildButton("a"),
                  _buildButton("aaaaaaaaaaa"),
                  _buildButton("aaaaaaaaAAAAAAA"),
                  IntrinsicHeight(child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                    _buildContenner("a"),
                    _buildContenner("aaaaaaaaaaa"),
                    _buildContenner("aaaaaaaaAAAAAAA"),

                  ],) ,)

                ],
              ),
            )),
      ),
    );
  }

  Widget _buildButton(String text) {
    return RaisedButton(
      child: Text(text),
      onPressed: () {},
    );
  }

  Widget _buildContenner(String text) {
    return Container(
      child: Text(text),
      width: 30,
      color: Colors.blue,
    );
  }
}