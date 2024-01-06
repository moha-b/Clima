import 'package:clima/core/utils/app_decoration.dart';
import 'package:clima/core/utils/app_dimn.dart';
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
          Text(widget.forecast[0].todayDate!),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppDimensions.height! * 0.005),
            HourlyForecastDetails(forecastList: widget.forecast),
            SizedBox(height: AppDimensions.height! * 0.02),
            DayAndNight(
              sunset: widget.forecast[0].sunset!,
              sunrise: widget.forecast[0].sunrise!,
            ),
          ],
        ),
      ),
    );
  }
}

class DayAndNight extends StatelessWidget {
  const DayAndNight({
    super.key,
    required this.sunset,
    required this.sunrise,
  });
  final String sunset;
  final String sunrise;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.width! * 0.03),
      decoration: AppDecoration.container(context),
      width: AppDimensions.width,
      height: AppDimensions.height! * 0.25,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(sunrise),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(sunset),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
