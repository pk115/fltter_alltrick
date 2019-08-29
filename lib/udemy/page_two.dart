import 'package:flutter/material.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(height: 100,
            color: Colors.red,
        ),
        Container(height: 100,
          color: Colors.green,
        ),
        Container(height: 100,
          color: Colors.blue,
        ),Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 100,
                color: Colors.pink,
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                color: Colors.orange,
              ),
            )
          ],
          
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 100,
                color: Colors.yellow,
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                color: Colors.blueAccent,
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                color: Colors.brown,
              ),
            )
          ],

        )
      ],
    );
  }
}
