part of 'widgets.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.weather,
  });
  final Weather weather;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TimeAndLocation(
              date: weather.date,
              cityName: weather.cityName,
            ),
          ),
          Expanded(
            flex: 2,
            child: WeatherImage(
              image: weather.image,
            ),
          ),
          Expanded(
            flex: 2,
            child: WeatherStatus(
              temperature: weather.temperature,
              weatherState: weather.weatherState,
              textColor: weather.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
