import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseTables {
  static final DatabaseTables _instance = DatabaseTables.internal();

  factory DatabaseTables() => _instance;

  DatabaseTables.internal();

  static Database? _db;

  int _versionDb = 1;

  int get versionDb => _versionDb;

  //short setter for my variable
  set versionDb(int? value) => _versionDb = value!;

  Future<Database?> createDb() async {
    if (_db != null) {
      return _db;
    }
    String path =
        join(await getDatabasesPath(), "property_managment_system.db");
    var appDb = await openDatabase(path,
        version: versionDb,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onConfigure: _onConfigure);
    return appDb;
  }

  deleteMyDatabase() async {
    await deleteDatabase(
        join(await getDatabasesPath(), "property_managment_system.db"));
  }

  FutureOr<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    // If you need to add a column
    if (newVersion > oldVersion) {
      db.execute("ALTER TABLE foo ADD COLUMN new_column INTEGER DEFAULT 0");
    }
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "create table myIdentity(id integer primary key autoincrement,token TEXT,name TEXT,email TEXT,user_role integer,imageUrl TEXT,phoneNumber TEXT,serverId integer)");
  }
}
