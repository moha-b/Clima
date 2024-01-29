part of 'widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.daily, required this.temperature});

  final Daily daily;
  final num temperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimensions.width! * 0.03,
        vertical: AppDimensions.height! * 0.02,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: TemperatureText(temperature: temperature.toString()),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: WeatherImage(
                    image: context.read<HomeCubit>().theme?.image,
                    begin: -10,
                    end: 10,
                    isCenter: false,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "${daily.temperatureMin}° ~ ${daily.temperatureMax}°",
                ),
                Text(
                  "feels like ${daily.apparentTemperature}°",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
