import 'package:flutter/material.dart';

class GridView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GridView EP1",
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridView EP1"),
        ),
        body: GridView.extent(
          padding: EdgeInsets.all(8),
            //crossAxisSpacing: 8,
            //mainAxisSpacing: 8,
            //childAspectRatio: 1,
            //crossAxisCount: 3,//colum
          maxCrossAxisExtent:150,
          children: _buildGridLisrcard(21),
        ),
      ),
    );
  }

  List<Container> _buildGridLisr(int count){
    return List.generate(count,(index)=>Container(
      child:Image.network('https://cdn3.movieweb.com/i/article/k9MXGu0TNTCW32gKTZgnZla0E55A26/738:50/Batman-Movie-1989-Willem-Dafoe-Joker-Tim-Burton.jpg',
      fit: BoxFit.cover,) ,
    ));



  }

  List<Card> _buildGridLisrcard(int count){
    return List.generate(count,(index)=>Card(
      child:Image.network('https://cdn3.movieweb.com/i/article/k9MXGu0TNTCW32gKTZgnZla0E55A26/738:50/Batman-Movie-1989-Willem-Dafoe-Joker-Tim-Burton.jpg',
        fit: BoxFit.cover,) ,
    ));



  }
}
