import 'package:clima/features/hourly_forecast/data/models/weather_daily_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/temperature_text.dart';
import '../../../../core/common/weather_image.dart';
import '../../../../core/helper/location_helper.dart';
import '../../../../core/utils/utils.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.daily, required this.temperature});

  final Daily daily;
  final num temperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.width! * 0.03,
        vertical: AppDimensions.height! * 0.02,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: TemperatureText(temperature: temperature.toString()),
                  ),
                ),
                Text(Location.instance.city, style: AppTypography.bold24()),
                Text(
                  Location.instance.country,
                  style: AppTypography.thin14(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WeatherImage(
                      image: daily.theme.image,
                      begin: -10,
                      end: 10,
                      isCenter: false,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "${daily.temperatureMin} / ${daily.temperatureMax}  feels like ${daily.apparentTemperature}",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
