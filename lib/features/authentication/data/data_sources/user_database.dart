import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';

import '../models/user_model.dart';

// TODO: Delete Function has to be Created.
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

final connectionURL =
    "mongodb+srv://casca:casca@casca.gctq7.mongodb.net/CascaDB?retryWrites=true&w=majority";

Future<void> main() async {
  var data;

  try {
    await CascaUsersDB.connect();
    // data = await CascaUsersDB.getUserByEmail("gk.kush2005@gmail.com");
    data = await CascaUsersDB.getData();
int a = data[1]['mobNo'].toInt();
    print(a);
    // if (data != null && data.isNotEmpty) {
    //   var firstUser = data[0]['_id'] as ObjectId;
    //   print('First User: ${firstUser.oid.toString()}'); // Debugging the first document
    // } else {
    //   print('No data found.');
    // }
  } catch (e) {
    print('Error: $e');
  }
}

class CascaUsersDB {
  static Db? db;
  static DbCollection? collection;

  CascaUsersDB();

  static Future<void> connect() async {
    db = await Db.create(connectionURL);
    await db?.open();
    inspect(db);
    collection = db?.collection('Users');
    print("Connected to Users Collection");
  }

  // Get All Data
  static Future<List<Object>?> getData() async {
    try {
      final users = await collection?.find().toList();
      return users;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  // Get All Users Method
  static Future<List<User>?> getUsers() async {
    try {
      final users = await collection?.find().toList();
      return users?.map((user) => User.fromMap(user)).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Create a User
  static Future<bool?> createUser(String userName, String name, String dOB,
      String email, String password, int mobNo, String gender,
      {String? image}) async {
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
    try {
      final id = await collection?.insertOne(values);
      return id?.isSuccess;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Get By XYZ Methods
  static Future<User?> getUserByEmailAndPassword(
      String email, String password) async {
    try {
      final users = await collection
          ?.find(where.eq('email', email).eq('password', password))
          .toList();
      if (users?.length != 1) {
        return null;
      } else {
        return User.fromMap(users!.first);
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<List<User>> getUserByEmail(String email) async {
    try {
      final users = await collection?.find(where.eq('email', email)).toList();
      if (users!.isNotEmpty) {
        return users.map((user) => User.fromMap(user)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<List<User>> getUserById(String id) async {
    try {
      ObjectId objId = ObjectId.fromHexString(id);
      final users = await collection?.find(where.eq('_id', objId)).toList();
      if (users!.isNotEmpty) {
        return users.map((user) => User.fromMap(user)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  // Update Methods
  static Future<bool> updatePassword(String id, String password) async {
    try {
      // List<User> users = await getUserById(id);
      // User user = users[0];

      // final new_values = {
      //   'id': id,
      //   'userName': user.userName,
      //   'name': user.name,
      //   'dOB': user.dOB,
      //   'email': user.email,
      //   'password': password,
      //   'mobNo': user.mobNo,
      //   'gender': user.gender,
      //   'image': user.image,
      // };

      ObjectId objId = ObjectId.fromHexString(id);

      final result = await collection?.update(
          where.eq('_id', objId), modify.set('password', password));
      print(result.toString());
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Close Connection
  static Future<void> close() async {
    await db?.close();
    print('Connection to MongoDB closed');
  }
}
