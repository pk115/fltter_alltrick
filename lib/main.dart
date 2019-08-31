import 'package:flutter/material.dart';
import 'package:flutter_alltrick/main_menu.dart';
import 'package:flutter_alltrick/sqlite/add_member_screen.dart';
import 'package:flutter_alltrick/sqlite/add_screen.dart';
import 'package:flutter_alltrick/sqlite/member_screen.dart';
import 'package:flutter_alltrick/udemy/page_one.dart';
import 'package:flutter_alltrick/udemy/users_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('th', 'TH'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
//          fontFamily: 'SOV_BaanHook',
          brightness: Brightness.dark,
          accentColor: Colors.pink,
          primaryColor: Colors.pink),
      title: "Flutter Tutorial Excample",
      home: MainPage(),
      routes: <String, WidgetBuilder>{
        '/add': (BuildContext) => AddScreen('Hello'),
        '/photo': (BuildContext) => PageOne(),
        '/users': (BuildContext) => UsersScreen(),
        '/member': (BuildContext) => MemberScreen(),
        '/addmember': (BuildContext) => AddMemberScreen(null),
      },
    );
  }
}
