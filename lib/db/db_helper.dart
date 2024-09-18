import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  // Variables
  static const dbName = 'myDataBase.db';
  static const dbVersion = 1;
  static const dbTable = 'myTable';
  static const columnId = 'id';
  static const title = 'title';
  static const description = 'description';

  // Singleton instance
  static final DataBaseHelper instance = DataBaseHelper();

  // Database instance
  Database? _database;

  // Getter for database instance
  Future<Database> get database async {
    _database ??= await initDb();
    return _database!;
  }

  // Initialize the database
  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  // Create the table
  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $dbTable (
        $columnId INTEGER PRIMARY KEY,
        $title TEXT,
        $description TEXT
      )
    ''');
  }

  // Insert record
  Future<int> insertRecord(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(dbTable, row);
  }

  // Query records
  Future<List<Map<String, dynamic>>> queryDatabase() async {
    Database db = await instance.database;
    return await db.query(dbTable);
  }

  // Update record
  Future<int> updateRecord(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(dbTable, row, where: "$columnId = ?", whereArgs: [id]);
  }

  // Delete record
  Future<int> deleteRecord(int id) async {
    Database db = await instance.database;
    return await db.delete(dbTable, where: "$columnId = ?", whereArgs: [id]);
  }
}
