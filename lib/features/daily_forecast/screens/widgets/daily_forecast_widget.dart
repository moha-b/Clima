import 'package:clima/core/utils/utils.dart';
import 'package:clima/features/daily_forecast/data/models/daily_weather_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/animations/fade_slide_animation.dart';
import 'daily_widget.dart';

class DailyForecastWidget extends StatefulWidget {
  const DailyForecastWidget({
    super.key,
    required this.weatherModel,
  });

  final DailyWeatherModel weatherModel;
  @override
  _DailyForecastWidgetState createState() => _DailyForecastWidgetState();
}

class _DailyForecastWidgetState extends State<DailyForecastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weekly Forecast"),
      ),
      body: ListView.separated(
        itemCount: 15,
        padding: EdgeInsets.symmetric(
          vertical: AppDimensions.height! * 0.01,
          horizontal: AppDimensions.width! * 0.03,
        ),
        itemBuilder: (context, index) {
          return FadeSlideAnimation(
            controller: _controller,
            child: DailyWidget(weatherModel: widget.weatherModel, index: index),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 16),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
