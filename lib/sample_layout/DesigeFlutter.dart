import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
class DesingApp extends StatelessWidget {
  var _title = "Desing";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: ListView(
          children: <Widget>[
            headerSelection,
            titleSelection,
            buttonselection,
            courseselection
          ],
        ),
      ),
    );
  }

  Widget headerSelection = Image.network(
      "https://images.squarespace-cdn.com/content/v1/51b3dc8ee4b051b96ceb10de/1559403469315-IET6YVK2FNDL37CI6RR0/ke17ZwdGBToddI8pDm48kNvT88LknE-K9M4pGNO0Iqd7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1USOFn4xF8vTWDNAUBm5ducQhX-V3oVjSmr829Rco4W2Uo49ZdOtO_QXox0_W7i2zEA/a-new-spider-man-far-from-home-trailer-reveals-where-spidey-gets-his-new-red-and-black-suit-social.jpg?format=1500w"); //Container(height: 250,color:Colors.blue,);
  Widget titleSelection = Padding(
    padding: EdgeInsets.all(50),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "SPIDER-MAN: FAR FROM HOME ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                "There’s a new trailer that has leaked online. This is a ",
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          ),
        ),
        Icon(
          Icons.thumb_up,
          color: Colors.blue,
        ),
        Container(
          margin: EdgeInsets.only(left: 8),
          child: Text(" 100 Like"),
        )
      ],
    ),
  );

  //Container(height: 150,color:Colors.red,);

  Widget buttonselection =
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
    _buildButtonColumn(
      icon: Icons.thumb_up,
      label: "Like",
    ),
    _buildButtonColumn(
      icon: Icons.comment,
      label: "comment",
    ),
    _buildButtonColumn(
      icon: Icons.share,
      label: "share",
    ),
  ]);

  Widget courseselection = Container(
    margin: EdgeInsets.only(top: 70),
    padding: EdgeInsets.all(8),
    child:Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("SPIDER-MAN: FAR FROM HOME "),
      ),
      Container(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _buildCard(url:"https://akm-img-a-in.tosshub.com/indiatoday/images/story/201906/spiderman-770x433.png?L_mEhOzuc3kwBEQI1xiixD0p5vwjTR8t" ),
            _buildCard(url: "https://www.beartai.com/wp-content/uploads/2019/04/logo-spiderman.jpg"),
            _buildCard(url: "https://www.beartai.com/wp-content/uploads/2019/04/Culture_Spider-Man_FarFromHome_Trailer.jpg"),
            _buildCard(url:"https://ewedit.files.wordpress.com/2019/04/smffh_78328934893493443.jpg"),
          ],
        ),
      )
    ],) ,);


}

Column _buildButtonColumn({IconData icon, String label}) {
  var icColor = Colors.grey.shade500;
  return Column(
    children: <Widget>[
      IconButton(
        icon:Icon(icon,color: icColor,),
        onPressed: (){},
      ),
      Container(
        margin: EdgeInsets.only(top: 12),
        child: Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color:icColor),),
      )
    ],
  );
}

Card _buildCard({String url}){
  return Card(
    child:FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: url));
}