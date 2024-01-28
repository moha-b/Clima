import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/common/temperature_text.dart';
import '../../../../core/helper/date_helper.dart';
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
    return Container(
      height: AppDimensions.height! * 0.197,
      padding: const EdgeInsets.all(8),
      decoration: AppDecoration.container(context, isBordered: true),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "${DateHelper.formatDate(weatherModel.time[index]!, 'EEEE')} • ${DateHelper.formatDate(weatherModel.time[index]!, 'MM-dd')}",
                    style: AppTypography.medium18()),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: Lottie.asset(weatherModel.image[index]!)),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DataWidget(
                  apparentTemperature:
                      "${weatherModel.windSpeed10mMax[index]}km/h",
                  icon: AppImages.windSvg),
              DataWidget(
                  apparentTemperature: "${weatherModel.snowfallSum[index]}%",
                  icon: AppImages.snowSvg),
              DataWidget(
                  apparentTemperature: "${weatherModel.rainSum[index]}%",
                  icon: AppImages.rainSvg),
              DataWidget(
                  apparentTemperature: "${weatherModel.rainSum[index]}°",
                  icon: AppImages.sunnySvg),
            ],
          ),
          const SizedBox(width: 16),
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

  final String apparentTemperature;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: AppDimensions.width! * 0.07,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          apparentTemperature,
          style: AppTypography.medium12(),
        ),
      ],
    );
  }
}
