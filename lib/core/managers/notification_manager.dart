part of 'managers.dart';

class NotificationManager {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones();
    log("initialized Successfully", name: "Notification Manager");
  }

  static sendBasicNotification({
    required String title,
    required String body,
    required String imageAssetPath,
  }) async {
    final tempDir = await getTemporaryDirectory();
    final imagePath = '${tempDir.path}/image.webp';
    // Copy the image from assets to the temporary directory
    ByteData data = await rootBundle.load(imageAssetPath);
    List<int> bytes = data.buffer.asUint8List();
    await File(imagePath).writeAsBytes(bytes);
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        'morning_channel_001',
        'notification',
        importance: Importance.max,
        largeIcon: FilePathAndroidBitmap(imagePath),
        playSound: true,
        sound: const RawResourceAndroidNotificationSound('bubble'),
        priority: Priority.high,
        colorized: true,
      ),
    );
    await _flutterLocalNotificationsPlugin.show(
      1,
      title,
      body,
      details,
      payload: "payload data",
    );
  }

  static Future<void> scheduleNotifications({
    required String body,
    required String imageAssetPath,
  }) async {
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
      6,
      0,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      001,
      "Today's weather in ${Location.instance.city}",
      body,
      scheduledTime,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'morning_channel_001',
          'schedule notification',
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
