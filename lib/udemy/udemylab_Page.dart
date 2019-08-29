import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add_screen.dart';
import 'login_Screen.dart';
import 'page_one.dart';
import 'page_two.dart';
import 'page_three.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List Page = [PageOne(), PageTwo(), PageThree()];

  TextStyle myStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

  Future<Null> getUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String User= await  prefs.get("Users");
    print(User);
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      title: Text("Main Screen"),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pushNamed('/photo')),
        IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => Navigator.of(context).pushNamed('/add')),
      ],
    );

    Future<Null> Logount() async{

      SharedPreferences prefs = await SharedPreferences.getInstance();
       await  prefs.remove("Users");

    }

    Widget floatingAction = FloatingActionButton(
      backgroundColor: Colors.red,
      onPressed: () async {
        var response = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddScreen('Value 1')));

        print(response['Name']??'Null');
      },
      child: Icon(Icons.add),
    );

    Widget bottomNavBar = BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                "หน้าหลัก",
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              title: Text(
                "ข้อมูลส่วนตัว",
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text(
                "ตั้งค่า",
              )),
        ]);

    bool hasimage = true;
    Widget drawer = Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
//          DrawerHeader(
//            child: Text('Drawer Header'),
//            decoration: BoxDecoration(
//              color: Colors.pinkAccent,
//            ),
//          ),
          UserAccountsDrawerHeader(
              currentAccountPicture: hasimage
                  ? CircleAvatar(
//                backgroundImage: NetworkImage('https://randomuser.me/api/portraits/med/men/77.jpg'),
                      backgroundImage: AssetImage('assets/image/bg4.jpg'),
                      child: Text('MM'),
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.white70,
                      child: Text(
                        "MM",
                        style: TextStyle(fontSize: 40.0, color: Colors.brown),
                      ),
                    ),
              accountName: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Text(
                  "Manee Meekam",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              accountEmail: Text("aaa@gmail.com"),
          decoration:BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/image/bg5.jpg'),fit: BoxFit.fill)
          ) ,
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'หน้าหลัก',
            ),
            subtitle:Text("หน้าหลัก") ,
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              'ผู้ใช้งาน',
            ),
            subtitle:Text("ผู้ใช้งาน") ,
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              'ผู้ใช้งานในระบบ',
            ),
            subtitle:Text("ผู้ใช้งานในระบบ") ,
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/users');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(
              'สมาชิก ',
            ),
            subtitle:Text("สมาชิก Member") ,
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/member');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'ตั้งค่า',
            ),
            subtitle:Text("ตั้งค่า") ,
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text(
              'ปิดโปรแกรม',
            ),
            subtitle:Text("ปิดโปรแกรม") ,
            trailing: Icon(Icons.exit_to_app),
            onTap: () {
              exit(0);
            },
          ),
          ListTile(
            title: Text(
              'ออกจากระบบ',
            ),
            subtitle:Text("ออกจากระบบ") ,
            trailing: Icon(Icons.exit_to_app),
            onTap: () {
              Logount();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => LoginScreen()));
             // exit(0);
            },
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Page[currentIndex],
      drawer: drawer,
      floatingActionButton: floatingAction,
      bottomNavigationBar: bottomNavBar,
    );
  }
}
