import 'dart:convert';
import 'dart:async';
import 'package:flutter_alltrick/models/currentposition.dart';
import 'package:flutter_alltrick/models/databaselite.dart';
import 'package:http/http.dart' as http;
import 'package:unique_identifier/unique_identifier.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;

Future<Null> SavePosion(bg.Location location) async {
  DatabaseLite db = DatabaseLite.internal();
  db.initDatabase();
  try {
    print("call SavePosition");
    //var jsonResponse = json.decode(_content);
    String identifier = await UniqueIdentifier.serial;

    var now = new DateTime.now();
    String datetime = now.toString();
    print(datetime);
    final response = await http.post(
      'https://dotnetcore-webapi.herokuapp.com/SavePosition',
      body: {
        'DeviceId': identifier,
        'Uuid': location.uuid,
        'Status': location.activity.type,
        'Created': datetime,
        'Latitude': location.coords.latitude.toString(),
        'Longitude': location.coords.longitude.toString(),
        'IsMoving': location.isMoving.toString(),
        'Accuracy': location.coords.accuracy.toString(),
        'Activity': location.activity.confidence.toString(),
        'Battery': location.battery.level.toString(),
        'IsCharging': location.battery.isCharging.toString(),
        'Speed': location.coords.speed.toString()
      },
    );

    //await db.savePosition(location);
//  print(json.encode(itemJson));
//  var token = "";
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      // token = jsonResponse['datalist'];
    } else {
      await db.SavePosition(location);
    }
  } on Exception catch (error) {
    await db.SavePosition(location);
  }
//    final response = await http.get('http://10.2.13.11:5000/api/simple');
//    final response2 = await http.get('http://localhost:5000/api/Simple/Login',);
}

Future<Null> DeleteAllPosion() async {
  DatabaseLite db = DatabaseLite.internal();
  db.initDatabase();
  try {
    print("call SavePosition");
    //var jsonResponse = json.decode(_content);
    String identifier = await UniqueIdentifier.serial;

    var now = new DateTime.now();
    String datetime = now.toString();
    print(datetime);
//    final response = await http.post(
//      'https://dotnetcore-webapi.herokuapp.com/DeleteAllPosion',
//      body: {},
//    );
    final response = await http
        .get('https://dotnetcore-webapi.herokuapp.com/DeleteAllPosion');

    //await db.savePosition(location);
//  print(json.encode(itemJson));
//  var token = "";
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      //await db.DeleteAllPosion();
      // token = jsonResponse['datalist'];
    } else {
//      await db.SavePosition(location);
    }
  } on Exception catch (error) {
//    await db.SavePosition(location);
  }
//    final response = await http.get('http://10.2.13.11:5000/api/simple');
//    final response2 = await http.get('http://localhost:5000/api/Simple/Login',);
}
