import 'package:flutter/material.dart';

class StaclLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Stack Layout" ,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack Layout"),
        ),
        body: Stack(
          alignment: Alignment(0,0.8),
          children: <Widget>[
            CircleAvatar(
              backgroundImage:NetworkImage("https://cdn3.movieweb.com/i/article/k9MXGu0TNTCW32gKTZgnZla0E55A26/738:50/Batman-Movie-1989-Willem-Dafoe-Joker-Tim-Burton.jpg"),
            radius: 100,
            ),
//            Image.network('https://cdn3.movieweb.com/i/article/k9MXGu0TNTCW32gKTZgnZla0E55A26/738:50/Batman-Movie-1989-Willem-Dafoe-Joker-Tim-Burton.jpg',
//              fit: BoxFit.cover,),
            Container(
              padding: EdgeInsets.fromLTRB(12,4,12,4),
              decoration: BoxDecoration(color: Colors.black45,borderRadius:BorderRadius.circular(4)),
              child: Text(" Hello ",style:TextStyle(color: Colors.white),),

            )
          ],
        ),
      ),

    );
  }
}
