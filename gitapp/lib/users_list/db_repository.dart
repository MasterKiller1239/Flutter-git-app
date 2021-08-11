import 'package:gitapp/users_list/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHandler {
  static final DatabaseHandler instance = DatabaseHandler._init();
  final String databaseName = 'githubUsersTable';
  static Database? _database;

  DatabaseHandler._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('githubUsersDB.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY ';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $databaseName ( 
  id $idType, 
  login $textType,
  avatar_url $textType
  )
''');
  }

  Future<void> addUsersToDatabase(List<User> users) async {
    final db = await instance.database;
    users.forEach((element)async {  await db.insert(databaseName, element.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);});
  }

  Future<List<User>> getUsersFromDatabase(String login) async {
    final db = await instance.database;

    final maps = await db.query(
      databaseName,
      columns: UserFields.values,
      where: '${UserFields.login} = ?',
      whereArgs: [login],
    );
    if (maps.isNotEmpty) {
      return maps.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('ID $login not found');
    }
  }

  Future<List<User>> getAllUsers() async {
    final db = await instance.database;

    final orderBy = '${UserFields.login} ASC';

    final result = await db.query(databaseName, orderBy: orderBy);

    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> deleteUser(int id) async {
    final db = await instance.database;

    return await db.delete(
      databaseName,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}