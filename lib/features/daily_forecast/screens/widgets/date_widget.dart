part of 'widgets.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.apparentTemperature,
    required this.icon,
  });

  final String apparentTemperature;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: AppDimensions.width! * 0.07,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 5),
        Text(
          apparentTemperature,
          style: AppTypography.medium12(),
        ),
      ],
    );
  }
}
