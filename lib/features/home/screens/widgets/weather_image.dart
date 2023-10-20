part of 'widgets.dart';

class WeatherImage extends StatelessWidget {
  const WeatherImage({
    super.key,
    required this.image,
  });
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        image!,
        fit: BoxFit.cover,
      ),
    );
  }
}
