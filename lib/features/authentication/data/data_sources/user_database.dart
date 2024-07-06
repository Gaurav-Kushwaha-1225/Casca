import 'package:Casca/features/authentication/data/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

final tableName = "casca_users_db";

class CascaUsersDB {
  // Initialize Database Method

  static Future<Database> db() async {
    return openDatabase(
      '$tableName.db',
      version: 1,
      onCreate: (Database database, int version) async {
        await createTable(database);
      },
    );
  }

  // Create Table Method

  static Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "userName" TEXT NOT NULL UNIQUE,
    "name" TEXT NOT NULL,
    "dOB" TEXT NOT NULL,
    "email" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL,
    "mobNo" INTEGER UNIQUE NOT NULL,
    "gender" TEXT NOT NULL,
    "image" TEXT
    );""");
  }

  // Create Users Method

  static Future<int> createUser(String userName, String name, String dOB,
      String email, String password, int mobNo, String gender,
      {String? image}) async {
    final db = await CascaUsersDB.db();

    final values = {
      'userName': userName,
      'name': name,
      'dOB': dOB,
      'email': email,
      'password': password,
      'mobNo': mobNo,
      'gender': gender,
      'image': image,
    };

    final id = await db.insert(tableName, values,
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  // Get All Users Method

  static Future<List<User>> getUsers() async {
    final db = await CascaUsersDB.db();
    final users = await db.query(tableName, orderBy: "id");
    return users.map((user) => User.fromSqfliteDatabase(user)).toList();
  }

  // Get By XYZ Methods

  static Future<List<User>> getUserByUserName(String userName) async {
    final db = await CascaUsersDB.db();
    final users = await db.query(tableName,
        where: "userName = ?", whereArgs: [userName], limit: 1);
    return users.map((user) => User.fromSqfliteDatabase(user)).toList();
  }

  static Future<User?> getUserByEmail_Password(
      String email, String password) async {
    final db = await CascaUsersDB.db();
    final users = await db.query(tableName,
        where: "email = ? , password = ?", whereArgs: [email, password]);
    if (users.length != 1) {
      return null;
    } else {
      return users.map((user) => User.fromSqfliteDatabase(user)).toList().first;
    }
  }

  static Future<List<User>> getUserByEmail(
      String email) async {
    final db = await CascaUsersDB.db();
    final users = await db.query(tableName,
        where: "email = ?", whereArgs: [email]);
      return users.map((user) => User.fromSqfliteDatabase(user)).toList();
    }

  static Future<List<User>> getUserById(int id) async {
    final db = await CascaUsersDB.db();
    final users = await db.query(tableName, where: "id = ?", whereArgs: [id]);
    return users.map((user) => User.fromSqfliteDatabase(user)).toList();
  }

  // Update Methods

  static Future<int> updatePassword(int id, String password) async {
    final db = await CascaUsersDB.db();

    List<User> users = await getUserById(id);
    User user = users[0];

    final new_values = {
      'id': id,
      'userName': user.userName,
      'name': user.name,
      'dOB': user.dOB,
      'email': user.email,
      'password': password,
      'mobNo': user.mobNo,
      'gender': user.gender,
      'image': user.image,
    };

    final result = await db
        .update(tableName, new_values, where: "id = ?", whereArgs: [id]);
    return result;
  }

// TODO: Delete Query SQL Table Function has to be Created.
// Read a single item by id
// The app doesn't use this method but I put here in case you want to see it
// static Future<List<Map<String, dynamic>>> getItem(int id) async {
//   final db = await SQLHelper.db();
//   return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
// }
//
// // Update an item by id
// static Future<int> updateItem(
//     int id, String title, String? description) async {
//   final db = await SQLHelper.db();
//
//   final data = {
//     'title': title,
//     'description': description,
//     'createdAt': DateTime.now().toString()
//   };
//
//   final result =
//   await db.update('items', data, where: "id = ?", whereArgs: [id]);
//   return result;
// }
//
// // Delete
// static Future<void> deleteItem(int id) async {
//   final db = await SQLHelper.db();
//   try {
//     await db.delete("items", where: "id = ?", whereArgs: [id]);
//   } catch (err) {
//     debugPrint("Something went wrong when deleting an item: $err");
//   }
// }
}
