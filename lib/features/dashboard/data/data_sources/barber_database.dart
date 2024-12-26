import 'dart:async';
import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

import '../models/barber_model.dart';

final connectionURL =
    "mongodb+srv://casca:casca@casca.gctq7.mongodb.net/CascaDB?retryWrites=true&w=majority";

Future<void> main() async {
  var data;
  bool isLoading = true;

  try {
    await CascaBarberDB.connect();
    data = await CascaBarberDB.getData();
    isLoading = false;
  } catch (e) {
    log(e as String);
  }
  log(data);
  log(isLoading as String);
}

// class CascaBarberDB {
//   Db? db;
//   DbCollection? collection;
//
//   CascaBarberDB();
//
//   // Function to connect to the MongoDB local_storage
//   Future<void> connect() async {
//     await Db.create(connectionURL);
//     await db!.open();
//     log('Connected to MongoDB');
//     collection = db!.collection('Content');
//   }
//
//   // Function to read and log the data from the collection
//   Future<List<Map<String, dynamic>>> readData() async {
//     if (collection != null) {
//       final cursor = await collection!.find().toList();
//       return cursor;
//     } else {
//       log('No collection found.');
//       List<Map<String, dynamic>> empty = [];
//       return empty;
//     }
//   }
//
//   // Function to close the connection
//   Future<void> close() async {
//     await db?.close();
//     log('Connection to MongoDB closed');
//   }
// }

class CascaBarberDB {
  static Db? db;
  static DbCollection? collection;

  CascaBarberDB();

  static Future<void> connect() async {
    db = await Db.create(connectionURL);
    await db?.open();
    inspect(db);
    collection = db?.collection('Content');
  }

  static Future<List<Map<String, dynamic>>?> getData() async {
    // if (collection != null) {
    //   final users = await collection?.find().toList();
    //   return users?[0]['name'];
    // } else {
    //   log('No collection found.');
    //   List<Map<String, dynamic>> empty = [];
    //   return empty;
    // }
    try {
      final users = await collection?.find().toList();
      return users;
    } catch (e) {
      log(e as String);
      return [];
    }
  }

  static Future<List<Barber>> getBerberById(String id) async {
    try {
      ObjectId objId = ObjectId.fromHexString(id);
      final barbers = await collection?.find(where.eq('_id', objId)).toList();
      if (barbers!.isNotEmpty) {
        return barbers.map((barber) => Barber.fromMap(barber)).toList();
      } else {
        return [];
      }
    } catch (e) {
      log(e as String);
      return [];
    }
  }

  static Future<void> close() async {
    await db?.close();
    log('Connection to MongoDB closed');
  }
}
