import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:clima/core/helper/location_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../features/daily_forecast/data/repo/daily_forecast_repo.dart';
import '../../features/daily_forecast/data/repo/daily_forecast_repo_impl.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/home/data/repo/home_repo_impl.dart';
import '../../features/hourly_forecast/data/repo/hourly_forecast_repo.dart';
import '../../features/hourly_forecast/data/repo/hourly_forecast_repo_impl.dart';

part 'dependency_manager.dart';
part 'notification_manager.dart';
