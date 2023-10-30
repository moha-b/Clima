part of 'widgets.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.cityName,
    required this.time,
    required this.weatherState,
    required this.temperature,
    required this.image,
    required this.textColor,
  });
  final String cityName;
  final String time;
  final String weatherState;
  final String temperature;
  final String image;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: TimeAndLocation(
              date: time,
              cityName: cityName,
            ),
          ),
          Expanded(
            flex: 2,
            child: WeatherImage(
              image: image,
            ),
          ),
          Expanded(
            flex: 2,
            child: WeatherStatus(
              temperature: temperature,
              weatherState: weatherState,
              textColor: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
