import 'package:flutter/material.dart';

import '../../data/models/daily_forecast_model.dart';

class DailyWeatherList extends StatelessWidget {
  const DailyWeatherList({
    super.key,
    required this.forecast,
  });

  final List<DailyForecast> forecast;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const Center(
            child: Text("No Data Yet"),
          );
        },
        childCount: forecast.length,
      ),
    );
  }
}

//Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Stack(
//               children: [
//                 CustomPaint(
//                   size: Size(
//                     AppDimensions.width!,
//                     (AppDimensions.width! * 0.4).toDouble(),
//                   ),
//                   painter: CustomShape(context: context),
//                 ),
//                 Positioned(
//                   top: 0,
//                   right: 16,
//                   child: SizedBox(
//                     height: AppDimensions.height! * 0.17,
//                     child: WeatherImage(image: forecast[index].image),
//                   ),
//                 ),
//                 Positioned(
//                   top: 16,
//                   left: 16,
//                   child: TemperatureText(
//                     temperature: forecast[index].temperature,
//                     style: AppTypography.bold56(),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 16,
//                   left: 16,
//                   child: Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: forecast[index].main,
//                           style: AppTypography.medium24(
//                             color: forecast[index].textColor,
//                           ),
//                         ),
//                         TextSpan(
//                           text: index == 0
//                               ? " • Today"
//                               : " • ${forecast[index].date}",
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
