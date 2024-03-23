part of 'widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.daily, required this.temperature});

  final Daily daily;
  final num temperature;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.allInsets,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: TemperatureText(temperature: temperature.toString()),
                  ),
                ),
                Text(
                  Location.instance.city,
                  style: AppTypography.bold24(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  Location.instance.country,
                  style: AppTypography.thin14(),
                  textAlign: TextAlign.center,
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
                SizedBox(height: 16.h),
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
