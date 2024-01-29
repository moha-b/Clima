import 'dart:async';

import 'package:clima/features/hourly_forecast/data/models/weather_daily_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/common/temperature_text.dart';
import '../../../../core/common/weather_image.dart';
import '../../../../core/helper/location_helper.dart';
import '../../../../core/utils/utils.dart';
import '../../../home/cubit/home_cubit.dart';
import '../../data/models/forecast_info_model.dart';
import '../../data/models/weather_hourly_model.dart';
import '../../data/models/weather_news_model.dart';

part 'custom_app_bar.dart';
part 'day_and_night_widget.dart';
part 'forecast_info_widget.dart';
part 'hourly_forecast_details.dart';
part 'hourly_forecast_widget.dart';
part 'news.dart';
part 'news_widget.dart';
