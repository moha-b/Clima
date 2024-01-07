part of 'widgets.dart';

class WeatherStatus extends StatelessWidget {
  const WeatherStatus({
    super.key,
    required this.temperature,
    required this.weatherState,
    this.textColor,
  });
  final String? temperature;
  final String? weatherState;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TemperatureText(temperature: temperature),
        Text(weatherState!,
            style: AppTypography.bold28(
              color: textColor,
            )),
      ],
    );
  }
}
