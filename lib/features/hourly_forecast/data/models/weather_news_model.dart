class WeatherNewsModel {
  String? title;
  String? url;

  WeatherNewsModel({this.title, this.url});

  factory WeatherNewsModel.fromJson(Map<String, dynamic> json) {
    return WeatherNewsModel(
        title: json['articles'][0]['title'], url: json['articles'][0]['url']);
  }
}
