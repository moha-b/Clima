import 'package:clima/core/helper/location_helper.dart';
import 'package:clima/core/utils/app_dimn.dart';
import 'package:clima/core/utils/app_typography.dart';
import 'package:clima/features/home/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/temperature_text.dart';
import '../../data/models/weather_daily_model.dart';
import '../../data/models/weather_hourly_model.dart';
import 'day_and_night_widget.dart';
import 'hourly_forecast_details.dart';

class HourlyForecastWidget extends StatefulWidget {
  const HourlyForecastWidget(
      {Key? key, required this.hourlyForecast, required this.dailyForecast})
      : super(key: key);
  final WeatherHourly hourlyForecast;
  final Daily dailyForecast;

  @override
  State<HourlyForecastWidget> createState() => _HourlyForecastWidgetState();
}

class _HourlyForecastWidgetState extends State<HourlyForecastWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's details"),
        actions: [
          Text(widget.dailyForecast.date),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: AppDimensions.height! * 0.01),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: AppDimensions.height! * 0.27,
                child: HourlyTopSection(widget: widget),
              ),
            ),
            SizedBox(height: AppDimensions.height! * 0.02),
            HourlyForecastDetails(hourlyForecast: widget.hourlyForecast),
            SizedBox(height: AppDimensions.height! * 0.02),
            DayAndNight(
              sunset: widget.dailyForecast.sunset,
              sunrise: widget.dailyForecast.sunrise,
            ),
          ],
        ),
      ),
    );
  }
}

class HourlyTopSection extends StatelessWidget {
  const HourlyTopSection({
    super.key,
    required this.widget,
  });

  final HourlyForecastWidget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: WeatherImage(
                  image: widget.dailyForecast.theme.image,
                  begin: -30,
                  end: 5,
                  isCenter: false,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "${widget.dailyForecast.temperatureMin} / ${widget.dailyForecast.temperatureMax} feels like ${widget.dailyForecast.apparentTemperature}",
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: TemperatureText(
                      temperature:
                          widget.hourlyForecast.temperature[0].toString()),
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
      ],
    );
  }
}
