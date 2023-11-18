import 'package:flutter/material.dart';

import '../../data/models/daily_forecast_model.dart';
import 'daily_weather_list.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({
    super.key,
    required this.forecast,
  });
  final List<DailyForecast> forecast;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("Weak Forecast"),
          pinned: true,
        ),
        DailyWeatherList(forecast: forecast),
      ],
    );
  }
}
