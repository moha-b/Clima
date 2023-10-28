import 'package:clima/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../data/models/daily_forecast_model.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({
    super.key,
    required this.forecast,
  });
  final List<Forecast> forecast;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Column(
        children: List.generate(
          5,
          (index) {
            return Expanded(
              child: Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).cardColor),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: RepaintBoundary(
                        child: Lottie.asset(forecast[index].image,
                            fit: BoxFit.contain),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            forecast[index].main,
                            style: AppTypography.bold24(
                              color: forecast[index].textColor,
                            ),
                          ),
                          Text(
                            forecast[index].description,
                            style: AppTypography.medium12(),
                          ),
                          Text(
                            index == 0
                                ? "${forecast[index].date} (today)"
                                : forecast[index].date,
                            style: AppTypography.medium12(),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            forecast[index].temperature,
                            style: AppTypography.bold28(),
                          ),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                forecast[index].humidity,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
