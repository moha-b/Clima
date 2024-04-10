part of 'widgets.dart';

class DayAndNight extends StatelessWidget {
  const DayAndNight({
    super.key,
    required this.sunset,
    required this.sunrise,
  });
  final String sunset;
  final String sunrise;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 16.horizontalInsets,
      padding: 16.allInsets,
      decoration: AppDecoration.container(context),
      width: AppDimensions.width,
      height: 200.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sunrise", style: AppTypography.medium18()),
                const SizedBox(height: 5),
                Text(sunrise),
                const SizedBox(height: 5),
                Expanded(
                  child: Image.asset(AppImages.daySun, fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sunset", style: AppTypography.medium18()),
                const SizedBox(height: 5),
                Text(sunset),
                const SizedBox(height: 5),
                Expanded(
                  child: Image.asset(AppImages.nightMoon, fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
