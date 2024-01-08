import 'package:clima/core/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../data/models/weather_daily_model.dart';
import '../../data/models/weather_hourly_model.dart';
import 'custom_app_bar.dart';
import 'day_and_night_widget.dart';
import 'forecast_info_widget.dart';
import 'hourly_forecast_details.dart';
import 'news_widget.dart';

class HourlyForecastWidget extends StatefulWidget {
  const HourlyForecastWidget(
      {super.key, required this.hourlyForecast, required this.dailyForecast});
  final WeatherHourly hourlyForecast;
  final Daily dailyForecast;

  @override
  State<HourlyForecastWidget> createState() => _HourlyForecastWidgetState();
}

class _HourlyForecastWidgetState extends State<HourlyForecastWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: AppDimensions.height! * 0.28,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: CustomAppBar(
                  daily: widget.dailyForecast,
                  temperature: widget.hourlyForecast.temperature[0],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.height! * 0.02),
            ),
            SliverToBoxAdapter(
              child:
                  HourlyForecastDetails(hourlyForecast: widget.hourlyForecast),
            ),
            const SliverToBoxAdapter(
              child: NewsWidget(),
            ),
            const SliverToBoxAdapter(
              child: ForecastInfoWidget(),
            ),
            SliverToBoxAdapter(
              child: DayAndNight(
                sunset: widget.dailyForecast.sunset,
                sunrise: widget.dailyForecast.sunrise,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.height! * 0.02),
            ),
          ],
        ),
      ),
    );
  }
}
