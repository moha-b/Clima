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
      height: 150.h,
      width: double.infinity,
      margin: 16.horizontalInsets,
      padding: 16.allInsets,
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
                SizedBox(height: 15.h),
                Text(list[index].title, style: AppTypography.bold14()),
                SizedBox(height: 5.h),
                Text("${list[index].content}${list[index].prefix}"),
              ],
            ),
          );
        }),
      ),
    );
  }
}
