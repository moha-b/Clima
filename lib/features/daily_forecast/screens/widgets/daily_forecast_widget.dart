part of 'widgets.dart';

class DailyForecastWidget extends StatefulWidget {
  const DailyForecastWidget({
    super.key,
    required this.weatherModel,
  });

  final DailyWeatherModel weatherModel;
  @override
  _DailyForecastWidgetState createState() => _DailyForecastWidgetState();
}

class _DailyForecastWidgetState extends State<DailyForecastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weekly Forecast"),
      ),
      body: ListView.separated(
        itemCount: widget.weatherModel.image.length,
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
        itemBuilder: (context, index) {
          return FadeSlideAnimation(
            controller: _controller,
            child: DailyWidget(weatherModel: widget.weatherModel, index: index),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(height: 16.h),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
