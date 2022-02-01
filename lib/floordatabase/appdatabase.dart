// database.dart

// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutterdemoproject/floordatabase/notificationdb.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'notificationdbdao.dart';



//part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Notificationdb])
abstract class AppDatabase extends FloorDatabase {
NotificationdbDao get notificationdbDao;
}
//usages
//final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
//  final notificationdbDao = database.notificationdbDao;
//
//  final notificationdb = Notificationdb(1, 'Frank',1);
//  await notificationdbDao.insertNotification(notificationdb);
//
//  final result = await notificationdbDao.findNotificationById(1);