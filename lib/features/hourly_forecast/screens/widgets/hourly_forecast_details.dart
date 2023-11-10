import 'package:clima/core/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/models/hourly_forecast_model.dart';

class HourlyForecastDetails extends StatelessWidget {
  const HourlyForecastDetails({
    super.key,
    required this.forecast,
  });
  final HourlyForecast forecast;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Lottie.asset(forecast.image),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    title: "Pressure",
                    color: AppColors.thunderstorm,
                    value: forecast.data.pressure.toDouble(),
                  ),
                  PieChartSectionData(
                    title: "Humidity",
                    color: AppColors.clear,
                    value: forecast.data.humidity.toDouble(),
                  ),
                  PieChartSectionData(
                    title: "Sea level",
                    color: AppColors.rain,
                    value: forecast.data.seaLevel.toDouble(),
                  ),
                  PieChartSectionData(
                    title: "Grand level",
                    color: AppColors.snow,
                    value: forecast.data.grndLevel.toDouble(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
