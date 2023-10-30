import 'package:flutter/material.dart';

import '../../data/models/hourly_forecast_model.dart';

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget({super.key, required this.forecast});
  final List<HourlyForecast> forecast;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: List.generate(
          forecast.length,
          (index) => Expanded(child: Text(forecast[index].date)),
        ),
      ),
    );
  }
}
