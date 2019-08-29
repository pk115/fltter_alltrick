import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:synchronized/synchronized.dart';

class DatabaseHelper {
  static Database _db;

  DatabaseHelper.internal();

  final _lock = new Lock();

//  final String table="users";

  String sqlCrate = ''' 
create table if not exists users(
 id INTEGER PRIMARY KEY AUTOINCREMENT,
 first_name TEXT,
 last_name TEXT,
 email TEXT,
 telephone TEXT,
 birth_date TEXT,
 image TEXT)
 ''';

  Future<Database> getDb() async {
    if (_db == null) {
      io.Directory documentDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentDirectory.path, 'udemy.db');

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

  Future saveDataUser(Map member) async {
    var dbClient = await getDb();
    String sql =
        '''INSERT INTO users(first_name,last_name,email,telephone,birth_date) VALUES(?,?,?,?,?)''';
    await dbClient.rawQuery(sql, [
      member['firstname'],
      member['lastname'],
      member['email'],
      member['telephone'],
      member['birthDate']
    ]);
    print("INSERT is Created");
  }

  Future UpdateDataUser(Map member) async {
    var dbClient = await getDb();
    String sql =
        '''UPDATE users set first_name=?,last_name=?,email=?,telephone=?,birth_date=?  WHERE id=? ''';
    await dbClient.rawQuery(sql, [
      member['firstname'],
      member['lastname'],
      member['email'],
      member['telephone'],
      member['birthDate'],
      member['id']
    ]);
    print("update");
  }

  Future getUser() async {
    var dbClient = await getDb();
    var sql = '''SELECT * FROM users ''';
    return await dbClient.rawQuery(sql);
  }

  Future deleteUser(int id) async {
    var dbClient = await getDb();
    var sql = '''DELETE  FROM users WHERE id=?''';
    return await dbClient.rawQuery(sql, [id]);
  }

  Future getUserDetail(int id) async {
    var dbClient = await getDb();
    var sql = '''SELECT *  FROM users WHERE id=?''';
    return await dbClient.rawQuery(sql, [id]);
  }
}
