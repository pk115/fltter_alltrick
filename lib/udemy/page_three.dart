import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Icon(Icons.mode_edit)),
                    Expanded(
                        flex: 5,
                        child: Text(
                          "ตั้งค่า",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/image/bg4.jpg'),
                ),
                title: Text("ข้อมูลส่วนตัว"),
                subtitle: Text("ssssss"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("ข้อมูลส่วนตัว"),
                subtitle: Text("ssssss"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),


            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Icon(Icons.mode_edit)),
                    Expanded(
                        flex: 5,
                        child: Text(
                          "ตั้งค่า",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/image/bg4.jpg'),
                ),
                title: Text("ข้อมูลส่วนตัว"),
                subtitle: Text("ssssss"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("ข้อมูลส่วนตัว"),
                subtitle: Text("ssssss"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("ข้อมูลส่วนตัว"),
                subtitle: Text("ssssss"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("ข้อมูลส่วนตัว"),
                subtitle: Text("ssssss"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(child: Icon(Icons.mode_edit)),
                    Expanded(
                        flex: 5,
                        child: Text(
                          "ตั้งค่า",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/image/bg4.jpg'),
                ),
                title: Text("ข้อมูลส่วนตัว"),
                subtitle: Text("ssssss"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("ข้อมูลส่วนตัว"),
                subtitle: Text("ssssss"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("ข้อมูลส่วนตัว"),
                subtitle: Text("ssssss"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("ข้อมูลส่วนตัว"),
                subtitle: Text("ssssss"),
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        )
      ],
    );
  }
}
