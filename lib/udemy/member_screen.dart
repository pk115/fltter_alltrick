import 'package:flutter/material.dart';
import 'package:flutter_alltrick/utils/database_helper.dart';
//import 'package:barcode_scan/barcode_scan.dart';
import 'add_member_screen.dart';
import 'package:flutter/services.dart';

class MemberScreen extends StatefulWidget {
  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  DatabaseHelper db = DatabaseHelper.internal();
  List Members = [];

  String barcode;

  Future getuser() async {
    var res = await db.getUser();
    setState(() {
      Members = res;
    });
    print(res);
  }

  Future Deleteuser(int id) async {
    //dialogshow
    showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text("Delete....?")],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () async {
                    await db.deleteUser(id);
                    getuser();
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes")),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("NO"))
            ],
          );
        });

    //
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  @override
  Widget build(BuildContext context) {
//    Future scan() async {
//      try {
////        String barcode = await BarcodeScanner.scan();
//        setState(() {
//          this.barcode = barcode;
//        });
//      } on PlatformException catch (e) {
//        if (e.code == BarcodeScanner.CameraAccessDenied) {
//          setState(() {
//            this.barcode = "Permission Camera";
//          });
//        } else {
//          setState(() {
//            this.barcode = "Error: $e";
//          });
//        }
//      }
//      print(this.barcode);
//    }

    return Scaffold(
      appBar: AppBar(
        title: Text("member"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.camera), onPressed: () => {} //scan()//scan()
              )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, int index) {
          return ListTile(
            onTap: () async {
              var response = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AddMemberScreen(Members[index]['id'])));
              print(response);
              if (response['ok']) {
                getuser();
              }
            },
            title: Text(
                '${Members[index]['first_name']} ${Members[index]['last_name']}'),
            subtitle: Text('${Members[index]['email']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Deleteuser(Members[index]['id']);
              },
            ),
          );
        },
        itemCount: Members != null ? Members.length : 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //Navigator.of(context).pushNamed('/addmember');
          var response = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddMemberScreen(null)));
          print(response + 'AAA');
          if (response != null) {
            getuser();
          }
        },
        child: Icon(Icons.person_add),
      ),
    );
  }
}
