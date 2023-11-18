import 'package:flutter/material.dart';

import '../../data/models/hourly_forecast_model.dart';
import 'hourly_forecast_details.dart';

class HourlyForecastWidget extends StatefulWidget {
  const HourlyForecastWidget({Key? key, required this.forecast})
      : super(key: key);
  final List<HourlyForecast> forecast;

  @override
  State<HourlyForecastWidget> createState() => _HourlyForecastWidgetState();
}

class _HourlyForecastWidgetState extends State<HourlyForecastWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's details"),
        actions: [
          Text(widget.forecast[0].day),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          HourlyForecastDetails(forecastList: widget.forecast),
        ],
      ),
    );
  }
}
