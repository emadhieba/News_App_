import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db == await createDatabase();
      return _db;
    } else {
      return _db;
    }
  }

  Future<Database> createDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(
      databasepath,
      'todo.db',
    );
    Database mydb = await openDatabase(path,
        onCreate: _oncreate, version: 1, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print('creat database /////////');
  }

  _oncreate(Database db, int version) async {
    {
      await db.execute(
          ''' CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)
             
      ''');
      print('creat database /////////');
    }
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  ubdateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}
