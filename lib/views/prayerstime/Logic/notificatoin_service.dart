import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  static final _notification = FlutterLocalNotificationsPlugin();

  static init() async {
    await _notification.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );

    tz.initializeTimeZones();
    // if (await Permission.notification.isDenied) {
    //     await Permission.notification.request();
    //   }
  }

  static Future<void> schiduleNotification(
    String title,
    String body,
    DateTime dateTime, {
    RepeatInterval repeatInterval = RepeatInterval.daily,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      'alarm_channel',
      'Alarm Notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      sound: RawResourceAndroidNotificationSound(
        'alarm',
      ), // Custom sound for Android
      fullScreenIntent: true,
    );
    // final iosDetails = DarwinNotificationDetails(
    //   sound: 'alarm', // Custom sound for iOS
    // );
    final notificationDetails = NotificationDetails(android: androidDetails);

    final scheduledTime = tz.TZDateTime.from(dateTime, tz.local);

    await _notification.zonedSchedule(
      DateTime.now().millisecondsSinceEpoch ~/ 1000, // unique id
      title,
      body,
      scheduledTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  static Future<void> cancelNotification(int notificationId) async {
    await _notification.cancel(
      notificationId,
    ); // Cancel the notification if needed
  }
}
