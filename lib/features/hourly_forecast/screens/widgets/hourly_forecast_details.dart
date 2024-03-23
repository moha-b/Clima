part of 'widgets.dart';

class HourlyForecastDetails extends StatelessWidget {
  const HourlyForecastDetails({
    super.key,
    required this.hourlyForecast,
  });

  final WeatherHourly hourlyForecast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: ListView.separated(
        itemCount: hourlyForecast.time.length,
        padding: 16.horizontalInsets,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => Container(
          decoration: AppDecoration.container(context),
          width: 90.w,
          padding: 8.allInsets,
          child: Column(
            children: [
              Expanded(
                child: Text(hourlyForecast.time[index]),
              ),
              Expanded(
                flex: 3,
                child: RepaintBoundary(
                  child: Lottie.asset(hourlyForecast.image[index]),
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: Text(
                  hourlyForecast.temperature[index].toString(),
                  style: AppTypography.medium14(),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.water_drop_outlined, size: 16),
                    Text(hourlyForecast.humidity[index].toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
      ),
    );
  }
}
