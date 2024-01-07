import 'package:clima/core/utils/app_decoration.dart';
import 'package:clima/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/models/weather_hourly_model.dart';

class HourlyForecastDetails extends StatelessWidget {
  const HourlyForecastDetails({
    super.key,
    required this.hourlyForecast,
  });

  final WeatherHourly hourlyForecast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height! * 0.2,
      child: ListView.separated(
        itemCount: hourlyForecast.time.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Container(
          decoration: AppDecoration.container(context),
          width: AppDimensions.width! * 0.25,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: Text(hourlyForecast.time[index]),
              ),
              Expanded(
                flex: 3,
                child: RepaintBoundary(
                  child: Lottie.asset(hourlyForecast.image[index]),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  hourlyForecast.temperature[index].toString(),
                  style: AppTypography.medium14(),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.water_drop_outlined, size: 16),
                    Text(hourlyForecast.humidity[index].toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}
