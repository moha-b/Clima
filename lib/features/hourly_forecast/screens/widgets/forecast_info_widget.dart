import 'package:clima/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/forecast_info_model.dart';
import '../../data/models/weather_daily_model.dart';

class ForecastInfoWidget extends StatelessWidget {
  const ForecastInfoWidget({
    super.key,
    required this.forecast,
  });
  final Daily forecast;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height! * 0.18,
      margin: EdgeInsets.only(
        left: AppDimensions.width! * 0.03,
        right: AppDimensions.width! * 0.03,
        top: AppDimensions.height! * 0.02,
      ),
      padding: const EdgeInsets.all(16),
      decoration: AppDecoration.container(context),
      child: Row(
        children: List.generate(3, (index) {
          var list = getForecastInfo(
              uvIndex: forecast.uvIndexMax.toString(),
              wind: forecast.windSpeed.toString(),
              humidity: forecast.humidity.toString());
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SvgPicture.asset(list[index].image,
                      fit: BoxFit.contain, width: AppDimensions.width! * 0.14),
                ),
                Text(list[index].title, style: AppTypography.bold14()),
                Text(list[index].content),
              ],
            ),
          );
        }),
      ),
    );
  }
}
