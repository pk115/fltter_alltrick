import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  var params;
  AddScreen(this.params);
  @override
  _AddScreenState createState() => _AddScreenState(params);
}

class _AddScreenState extends State<AddScreen> {
  var params;
  _AddScreenState(this.params);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add data"),
      ),
      body: ListView(
        children: <Widget>[
          Text("Add data"),
          Text('Params: $params'),
          RaisedButton(
            color: Colors.pink,
            onPressed: () {
              Navigator.of(context).pop({'ID':1000,'Name':'Hello'});

            },
            child: Text("Back"),
          )
        ],
      ),
    );
  }
}
