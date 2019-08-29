import 'package:flutter/material.dart';

class Row_Colum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Row & Colum",
      home: Scaffold(
          appBar: AppBar(
            title: Text("Row & Colum"),
          ),
          body: Row(
            children: <Widget>[
              FlutterLogo(
                size: 50,
              ),

              Container(
                margin: EdgeInsets.only(left: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Header",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Detail")
                  ],
                ),
              )
            ],
          )),
    );
  }
}
