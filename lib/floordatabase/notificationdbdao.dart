//notificationdbdao.dart

import 'package:floor/floor.dart';
import 'package:flutterdemoproject/floordatabase/notificationdb.dart';

@dao
abstract class NotificationdbDao {
  @Query('SELECT * FROM notificationdb')
  Future<List<Notificationdb>> findAllNotifications();

  @Query('SELECT * FROM notificationdb WHERE id = :id')
  Stream<Notificationdb> findNotificationById(int id);

  @insert
  Future<void> insertNotification(Notificationdb notification);
  @Query('DELETE FROM notificationdb WHERE id = :id')
  Future<void> delete(int id);
}