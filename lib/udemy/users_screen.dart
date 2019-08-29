import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  var users;
  bool isLoading = true;

  Future<Null> getUsers() async {
    final response = await http.get('https://randomuser.me/api/?results=20');

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      setState(() {
        isLoading = false;
        users = jsonResponse['results'];
      });
      print(users);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text("User List"),
      ),
      body: Card(
        child: RefreshIndicator(
          onRefresh: getUsers,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                itemBuilder: (context, int index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(backgroundImage:NetworkImage(users[index]['picture']['medium']),),
                        title: Text(
                          "${users[index]['name']['first']}  ${users[index]['name']['last']}",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text('${users[index]['email']}'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {},
                      ),
                      Divider()
                    ],
                  );
                },
                itemCount: users != null ? users.length : 0,
              ),
        ),
      ),
    );
  }
}
