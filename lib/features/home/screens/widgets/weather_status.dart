part of 'widgets.dart';

class WeatherStatus extends StatelessWidget {
  const WeatherStatus({
    super.key,
    required this.temperature,
    required this.weatherState,
  });
  final String? temperature;
  final String? weatherState;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GradientText(
          temperature!,
          style: AppTypography.bold144(),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: isNight ? [0.3, 1.0] : [0.4, 1.0],
            colors: isNight
                ? [
                    AppColors.white,
                    const Color(0xff111827),
                  ]
                : [
                    const Color(0xff111827),
                    const Color(0xff6B7280),
                  ],
          ),
        ),
        Text(weatherState!,
            style: AppTypography.bold24(
              color: const Color(0xFFFE8E26),
            )),
      ],
    );
  }
}
