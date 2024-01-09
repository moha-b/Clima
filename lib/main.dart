import 'package:clima/core/helper/functions.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  /// [initialization]
  /// contains initialization for
  /// 1 - [WidgetsFlutterBinding]
  /// 2 - [setup] - Custom setup logic, for get_it service.
  /// 3 - [Bloc.observer] - Custom observer for BLoC events.
  /// 4 - [LottieCache] - Preloading Lottie animations.
  /// 5 - [Notifications] - initialize notification service.
  /// 6 - [Dotenv] - store apis in '.env' file.
  await initialization();
  runApp(const MyApp());
}
