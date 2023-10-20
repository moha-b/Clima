part of 'widgets.dart';

class TimeAndLocation extends StatelessWidget {
  const TimeAndLocation({
    super.key,
    this.date,
    this.cityName,
  });
  final String? date;
  final String? cityName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          date!,
          style: AppTypography.medium18(
            color: AppColors.secondary,
          ),
        ),
        Flexible(
          child: Text(
            cityName!,
            style: AppTypography.bold48(color: Theme.of(context).primaryColor),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
