import 'dart:io';

import 'package:clima/core/helper/location_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones();
  }

  static Future<void> scheduleNotifications({
    required String body,
    required String imageAssetPath,
  }) async {
    var currentPosition = await LocationHelper.instance.getLatLong();
    await LocationHelper.instance
        .getPositionDetails(currentPosition: currentPosition);
    final tempDir = await getTemporaryDirectory();
    final imagePath = '${tempDir.path}/image.webp';
    // Copy the image from assets to the temporary directory
    ByteData data = await rootBundle.load(imageAssetPath);
    List<int> bytes = data.buffer.asUint8List();
    await File(imagePath).writeAsBytes(bytes);
    final now = tz.TZDateTime.now(tz.local);
    final scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      8,
      0,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      001,
      "Today's weather in ${Location.instance.country}, ${Location.instance.city}",
      body,
      scheduledTime,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'morning_channel_001',
          'morning message',
          importance: Importance.max,
          largeIcon: FilePathAndroidBitmap(imagePath),
          playSound: true,
          sound: const RawResourceAndroidNotificationSound('bubble'),
          priority: Priority.high,
          colorized: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
