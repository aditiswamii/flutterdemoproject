// entity/notificationdb.dart

import 'package:floor/floor.dart';

@Entity(tableName: 'notificationdb')
class Notificationdb {
  @primaryKey
  final int id;

  @ColumnInfo(name :"name")
  final String name;

  @ColumnInfo(name: 'notification_id')
  final int notificationId;
  Notificationdb(this.id, this.name,this.notificationId);
}