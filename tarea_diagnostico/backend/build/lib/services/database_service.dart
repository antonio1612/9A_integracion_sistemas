// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

class DatabaseService {
  static final db = Db('mongodb://root:root@mongo-backend:27017/cocina');
  //start the database
  static Future<void> startDb() async {
    if (db.isConnected == false) {
      await db.open();
    }
  }

  //close the database
  static Future<void> closeDb() async {
    if (db.isConnected == true) {
      await db.close();
    }
  }

  //collections
  static final cocinerosCollection = db.collection('cocineros');

  // we will use this method to start the database connection and use it in our routes
  static Future<Response> startConnection(
    RequestContext context,
    Future<Response> callBack,
  ) async {
    try {
      await startDb();
      return await callBack;
    } catch (e) {
      return Response.json(
        statusCode: 500,
        body: {'message': 'Error db'},
      );
    }
  }
}
