import 'package:clima/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/models/hourly_forecast_model.dart';

class HourlyForecastDetails extends StatelessWidget {
  const HourlyForecastDetails({
    super.key,
    required this.forecastList,
  });

  final List<HourlyForecast> forecastList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height! * 0.2,
      child: ListView.separated(
        itemCount: forecastList.length,
        padding: const EdgeInsets.only(left: 16),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).focusColor,
          ),
          width: AppDimensions.width! * 0.25,
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                child: Text(forecastList[index].hour!),
              ),
              Expanded(
                flex: 3,
                child: RepaintBoundary(
                  child: Lottie.asset(forecastList[index].image!),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  forecastList[index].temperature!.toString(),
                  style: AppTypography.medium14(),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.water_drop_outlined, size: 16),
                    Text(forecastList[index].humidity.toString()),
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
