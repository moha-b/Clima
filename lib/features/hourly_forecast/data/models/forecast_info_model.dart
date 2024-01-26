import 'package:clima/core/utils/app_images.dart';

class ForecastInfoModel {
  final String title;
  final String image;
  final String content;
  final String prefix;

  ForecastInfoModel(this.title, this.image, this.content, this.prefix);
}

List<ForecastInfoModel> getForecastInfo({
  required String uvIndex,
  required String humidity,
  required String wind,
}) {
  List<ForecastInfoModel> forecastInfoList = [
    ForecastInfoModel("UV index", AppImages.sunSvg, uvIndex, "°"),
    ForecastInfoModel("Humidity", AppImages.humiditySvg, humidity, "%"),
    ForecastInfoModel("Wind", AppImages.windSvg, wind, "km/h"),
  ];
  return forecastInfoList;
}
