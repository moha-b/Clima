import 'package:clima/core/helper/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/temperature_text.dart';
import '../../../../core/utils/utils.dart';
import '../../data/models/daily_weather_model.dart';

class DailyWidget extends StatelessWidget {
  const DailyWidget({
    super.key,
    required this.weatherModel,
    required this.index,
  });
  final DailyWeatherModel weatherModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.height! * 0.197,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "${DateHelper.formatDate(weatherModel.time[index]!, 'EEEE')} • ${DateHelper.formatDate(weatherModel.time[index]!, 'MM-dd')}",
              style: AppTypography.medium18()),
          SizedBox(height: 8),
          Container(
            height: AppDimensions.height! * 0.15,
            padding: const EdgeInsets.all(8),
            decoration: AppDecoration.container(context, isBordered: true),
            child: Row(
              children: [
                Expanded(child: Lottie.asset(weatherModel.image[index]!)),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: TemperatureText(
                              temperature:
                                  "${weatherModel.temperature[index]}"),
                        ),
                      ),
                      Text(
                          "feels like ${weatherModel.apparentTemperature[index]}"),
                    ],
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DataWidget(
                          apparentTemperature:
                              weatherModel.windSpeed10mMax[index],
                          icon: Icons.wind_power),
                      DataWidget(
                          apparentTemperature: weatherModel.snowfallSum[index],
                          icon: Icons.ac_unit),
                      DataWidget(
                          apparentTemperature: weatherModel.rainSum[index],
                          icon: Icons.water_drop_outlined),
                      DataWidget(
                          apparentTemperature: weatherModel.uvIndexMax[index],
                          icon: Icons.upcoming),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.apparentTemperature,
    required this.icon,
  });

  final num? apparentTemperature;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 5),
        Text(
          apparentTemperature.toString(),
          style: AppTypography.medium12(),
        ),
      ],
    );
  }
}
