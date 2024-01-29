part of 'widgets.dart';

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget(
      {super.key,
      required this.hourlyForecast,
      required this.dailyForecast,
      required this.article});
  final WeatherHourly hourlyForecast;
  final Daily dailyForecast;
  final WeatherNewsModel article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: AppDimensions.height! * 0.28,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: CustomAppBar(
                daily: dailyForecast,
                temperature: hourlyForecast.temperature[0],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.height! * 0.02),
          ),
          SliverToBoxAdapter(
            child: HourlyForecastDetails(hourlyForecast: hourlyForecast),
          ),
          SliverToBoxAdapter(
            child: NewsWidget(
              article: article,
              dailyForecast: dailyForecast,
            ),
          ),
          SliverToBoxAdapter(
            child: ForecastInfoWidget(forecast: dailyForecast),
          ),
          SliverToBoxAdapter(
            child: DayAndNight(
              sunset: dailyForecast.sunset,
              sunrise: dailyForecast.sunrise,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: AppDimensions.height! * 0.02),
          ),
        ],
      ),
    );
  }
}
