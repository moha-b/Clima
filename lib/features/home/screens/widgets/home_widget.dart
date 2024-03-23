part of 'widgets.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.weather,
  });
  final WeatherData weather;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 24.horizontalInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TimeAndLocation(
              date: weather.date,
              cityName: Location.instance.city,
            ),
          ),
          Expanded(
            flex: 2,
            child: WeatherImage(
              image: weather.theme.image,
            ),
          ),
          Expanded(
            flex: 2,
            child: WeatherStatus(
              temperature: weather.temperature.toString(),
              weatherState: weather.weatherState.name.toString(),
              textColor: weather.theme.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
