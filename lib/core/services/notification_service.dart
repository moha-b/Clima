import 'dart:io';

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

  static Future<void> scheduleSunriseSunsetNotifications({
    required String title,
    required String body,
    required int sunriseTime,
    required int sunsetTime,
    required String imageAssetPath,
  }) async {
    final tempDir = await getTemporaryDirectory();
    final imagePath = '${tempDir.path}/image.webp';

    // Copy the image from assets to the temporary directory
    ByteData data = await rootBundle.load(imageAssetPath);
    List<int> bytes = data.buffer.asUint8List();
    await File(imagePath).writeAsBytes(bytes);

    DateTime sunrise = DateTime.fromMillisecondsSinceEpoch(sunriseTime * 1000);
    // Add 2 minutes to the sunrise time
    sunrise = sunrise.add(const Duration(minutes: 2));

    DateTime sunset = DateTime.fromMillisecondsSinceEpoch(sunsetTime * 1000);
    // Add 2 minutes to the sunrise time
    sunset = sunset.add(const Duration(minutes: 2));

    // Schedule sunrise notification
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      001,
      title,
      body,
      tz.TZDateTime.from(sunrise, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'sunrise_channel_001',
          'Sunrise Channel',
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

    // Schedule sunset notification
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      002,
      title,
      body,
      tz.TZDateTime.from(sunset, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'sunset_channel_002',
          'Sunset Channel',
          importance: Importance.max,
          largeIcon: FilePathAndroidBitmap(imagePath),
          priority: Priority.high,
          playSound: true,
          sound: const RawResourceAndroidNotificationSound('bubble'),
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
