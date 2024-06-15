import 'package:Casca/services/database/database_connection.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/users.dart';

class CascaDB {
  final tableName = "users";

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "userName" TEXT NOT NULL UNIQUE,
    "name" TEXT NOT NULL,
    "image" TEXT,
    "dOB" TEXT NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "mobNo" TEXT,
    "gender" TEXT  NOT NULL
    );""");
  }

  Future<int> create(
      {required String id,
      required String userName,
      required String name,
      String? image,
      required String dOB,
      required String email,
      String? mobNo,
      required String gender}) async {
    final database = await DatabaseService().database;
    final insertQuery = '''
    INSERT INTO $tableName (userName, name, image, dOB, email, mobNo, gender)
    VALUES (:userName, :name, :image, :dOB, :email, :mobNo, :gender);
  ''';

    final values = {
      'userName': userName,
      'name': name,
      'image': image,
      'dOB': dOB,
      'email': email,
      'mobNo': mobNo,
      'gender': gender,
    };

    final result = await database.rawInsert(insertQuery, [...values.values]);
    return result;
  }

  Future<List<User>> fetchAll() async {
    final database = await DatabaseService().database;
    final users = await database.rawQuery('''SELECT * FROM $tableName;''');
    return users.map((user) => User.fromSqfliteDatabase(user)).toList();
  }
}
