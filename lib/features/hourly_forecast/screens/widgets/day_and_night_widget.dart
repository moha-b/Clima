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
      margin: EdgeInsets.only(
        left: AppDimensions.width! * 0.03,
        right: AppDimensions.width! * 0.03,
        top: AppDimensions.height! * 0.02,
      ),
      padding: EdgeInsets.all(AppDimensions.width! * 0.035),
      decoration: AppDecoration.container(context),
      width: AppDimensions.width,
      height: AppDimensions.height! * 0.25,
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
                  child: Image.asset(
                    AppImages.daySun,
                    fit: BoxFit.cover,
                  ),
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
                  child: Image.asset(
                    AppImages.nightMoon,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
