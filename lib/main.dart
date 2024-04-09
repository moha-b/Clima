import 'package:clima/core/helper/functions.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  /// [initialization] contains initialization for
  /// 1 - [WidgetsFlutterBinding]
  /// 2 - [CacheHelper] - Shared Preferences.
  /// 3 - [LottieCache] - Preloading Lottie animations.
  /// 4 - [Notifications] - initialize notification manager.
  initialization();
  runApp(const MyApp());
}
