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
        GradientText(
          temperature!,
          style: AppTypography.bold144(),
          gradient: GlobalVariablesState.isNight
              ? const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [
                      0.3,
                      1
                    ],
                  colors: [
                      AppColors.white,
                      AppColors.primary,
                    ])
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 1.0],
                  colors: [
                    AppColors.primary,
                    AppColors.white,
                  ],
                ),
        ),
        Text(weatherState!,
            style: AppTypography.bold24(
              color: textColor,
            )),
      ],
    );
  }
}
