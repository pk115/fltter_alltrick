import 'package:flutter/material.dart';

class SizeBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isShow =true;
    return MaterialApp(
      title: "SizeBox",
      home: Scaffold(
        appBar: AppBar(
          title: Text("SizeBox"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Title",style: TextStyle(fontSize: 16),),
            Container(
              child: isShow ? SizedBox(height: 20,):Text("Sub Title"),
            ),
            Text("Detail : aaa bbb ccc")

          ],
        ),
      ),
    );
  }
}
