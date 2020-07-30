import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqfliteflutter/models/Note.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper; //singleton boject
  static Database _database;

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDesc = 'desc';
  String colPri = 'pri';
  String colDate = 'date';

  DatabaseHelper._createInstance(); //create instance of Database

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await _innitializeDatabase();
    }
    return _database;
  }

  //store location of database
  Future<Database> _innitializeDatabase() async {
    //Directory directory = await getApplicationDocumentDirectory();
    Directory directory = await getExternalStorageDirectory();
    var path = directory.path + 'notes.db';
    var mydb = await openDatabase(path, version: 1, onCreate: _createDb);
    return mydb;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,$colDesc TEXT,$colPri INTEGER,$colDate TEXT)');
  }
}
