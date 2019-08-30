import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expanded",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Expanded"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: Text("Data Base"),
                //color: Colors.red,
              )),
            Container(child: RaisedButton(onPressed: (){},child: Text("View"),),),
//              Expanded(
//                  child: Container(
//                    //child: Text("Hello W"),
//                    color: Colors.green,
//                  )),
//              Expanded(
//                flex: 2,
//                  child: Container(
//                    //child: Text("Hello W"),
//                    color: Colors.blue,
//                  )),
            ],
          ),

        ),
      ),
    );
  }
}
