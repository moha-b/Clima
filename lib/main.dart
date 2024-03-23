import 'package:clima/core/helper/functions.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  /// [initialization] contains initialization for
  /// 1 - [WidgetsFlutterBinding]
  /// 2 - [CacheHelper] - Shared Preferences.
  /// 3 - [LottieCache] - Preloading Lottie animations.
  /// 4 - [Notifications] - initialize notification manager.
  await initialization();
  runApp(const MyApp());
}
