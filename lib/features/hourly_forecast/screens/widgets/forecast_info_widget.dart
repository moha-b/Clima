part of 'widgets.dart';

class ForecastInfoWidget extends StatelessWidget {
  const ForecastInfoWidget({
    super.key,
    required this.forecast,
  });
  final Daily forecast;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height! * 0.2,
      width: double.infinity,
      margin: EdgeInsets.only(
        left: AppDimensions.width! * 0.03,
        right: AppDimensions.width! * 0.03,
        top: AppDimensions.height! * 0.02,
      ),
      padding: const EdgeInsets.all(16),
      decoration: AppDecoration.container(context),
      child: Row(
        children: List.generate(3, (index) {
          var list = getForecastInfo(
              uvIndex: forecast.uvIndexMax.toString(),
              wind: forecast.windSpeed.toString(),
              humidity: forecast.humidity.toString());
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SvgPicture.asset(list[index].image,
                      fit: BoxFit.contain, width: double.infinity),
                ),
                const SizedBox(height: 15),
                Text(list[index].title, style: AppTypography.bold14()),
                const SizedBox(height: 5),
                Text("${list[index].content}${list[index].prefix}"),
              ],
            ),
          );
        }),
      ),
    );
  }
}
