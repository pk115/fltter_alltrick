import 'package:flutter/material.dart';

class ListView4 extends StatelessWidget {
  final List<String> item =
      List<String>.generate(20, (index) => "Item:${++index}");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView EP4",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView EP4"),
        ),
        body: ListView.builder(
            itemCount: item.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.directions_bike),
                    title: Text("${item[index]}"),
                    subtitle: Text("Sub Title"),
                    trailing: Icon(Icons.notifications),
                    onTap: () {
                      print("${item[index]}");

                    },
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey.shade300,
                  )
                ],
              );
            }),
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ckick");
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("AndroidMonks"),
        ),
        body: Column(
          children: <Widget>[
            AlertDialog(
              title: Text("Sample Alert Dialog"),
              actions: <Widget>[
                FlatButton(
                  child: Text("No"),
                ),
                FlatButton(
                  child: Text("Yes"),
                )
              ],
              content: Text("This is the body of the alert Dialog"),
            )
          ],
        ));
  }
}
