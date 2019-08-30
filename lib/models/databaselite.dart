import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:synchronized/synchronized.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:unique_identifier/unique_identifier.dart';

// add package>>>> sqflite: any
//add package>>>>path_provider: any
//
//example
//DatabaseLite db = DatabaseLite.internal(); //Call Class
//db.initDatabase(); //Created Table
//
//await db.SavePosition(location);//Insert Data
//var res = await db.getPosition(); //select Data
// await db.UpdatePosition(location);//Update Data
//await db.deletePosition(uuid);// Delete Data
//var res = await db.getPositionbyID(uuid);//Select Data By ID

class DatabaseLite {
  static Database _db;

  DatabaseLite.internal();

  final _lock = new Lock();

//  final String table="users";

  String sqlCrate = ''' 
create table if not exists current_position(
 uuid TEXT PRIMARY KEY,
 device_id TEXT,
 status TEXT,
 created TEXT,
 latitude TEXT,
 longitude TEXT,
 is_moving TEXT,
 accuracy TEXT,
 activity TEXT,
 battery TEXT,
 is_charging TEXT,
 speed TEXT
 ) ''';

  Future<Database> getDb() async {
    if (_db == null) {
      io.Directory documentDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentDirectory.path, 'qolocationmap.db');
      await _lock.synchronized(() async {
        if (_db == null) {
          _db = await openDatabase(path, version: 1);
        }
      });
    }
    return _db;
  }

  Future initDatabase() async {
    var dbClient = await getDb();
    await dbClient.rawQuery(sqlCrate);
    print("Table is Created");
  }

  Future SavePosition(bg.Location location) async {
    var dbClient = await getDb();
    String identifier = await UniqueIdentifier.serial;

    var now = new DateTime.now();
    String datetime = now.toString();
    String sql =
        '''INSERT INTO current_position(uuid,device_id,status,created,latitude,longitude,is_moving,accuracy,activity,battery,is_charging,speed) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)''';
    await dbClient.rawQuery(sql, [
      location.uuid,
      identifier,
      location.activity.type,
      datetime,
      location.coords.latitude.toString(),
      location.coords.longitude.toString(),
      location.isMoving.toString(),
      location.coords.accuracy.toString(),
      location.activity.confidence.toString(),
      location.battery.level.toString(),
      location.battery.isCharging.toString(),
      location.coords.speed.toString()
    ]);
    print("INSERT Completed");
  }

  Future UpdatePosition(bg.Location location) async {
    var dbClient = await getDb();

    String identifier = await UniqueIdentifier.serial;
    var now = new DateTime.now();
    String datetime = now.toString();

    String sql =
        '''UPDATE current_position set device_id=?,status=?,created=?,latitude=?,longitude=?,is_moving=?,accuracy=?,activity=?,battery=?,is_charging=?,speed=?  WHERE uuid=? ''';
    await dbClient.rawQuery(sql, [
      identifier,
      location.activity.type,
      datetime,
      location.coords.latitude.toString(),
      location.coords.longitude.toString(),
      location.isMoving.toString(),
      location.coords.accuracy.toString(),
      location.activity.confidence.toString(),
      location.battery.level.toString(),
      location.battery.isCharging.toString(),
      location.coords.speed.toString(),
      location.uuid
    ]);
    print("update Completed");
  }

  Future getPosition() async {
    var dbClient = await getDb();
    var sql = '''SELECT * FROM current_position ''';
    return await dbClient.rawQuery(sql);
  }

  Future deletePosition(String uuid) async {
    var dbClient = await getDb();
    var sql = '''DELETE  FROM current_position WHERE uuid=?''';
    print("DELETE Completed");
    return await dbClient.rawQuery(sql, [uuid]);
  }

  Future getPositionbyID(String uuid) async {
    var dbClient = await getDb();
    var sql = '''SELECT *  FROM current_position WHERE uuid=?''';
    return await dbClient.rawQuery(sql, [uuid]);
  }
}
