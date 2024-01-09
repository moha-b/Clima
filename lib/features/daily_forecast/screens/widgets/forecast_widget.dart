import 'package:clima/core/common/temperature_text.dart';
import 'package:clima/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../../core/animations/fade_slide_animation.dart';

class DailyForecastWidget extends StatefulWidget {
  const DailyForecastWidget({
    super.key,
  });

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
            child: Container(
              height: AppDimensions.height! * 0.15,
              padding: const EdgeInsets.all(16),
              decoration: AppDecoration.container(context, isBordered: true),
              child: Row(
                children: [
                  const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: TemperatureText(temperature: "21"),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "got this feeling yeah you know",
                          style: AppTypography.medium12(),
                        ),
                        Text(
                          "cuz this magic in my bonces",
                          style: AppTypography.medium12(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
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
