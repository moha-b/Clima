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
        SizedBox(height: AppDimensions.height! * 0.021),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date!,
              style: AppTypography.medium18(
                color: AppColors.secondary,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Map()),
                );
              },
              icon: const Icon(Iconsax.location),
            ),
          ],
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              cityName!,
              style:
                  AppTypography.bold48(color: Theme.of(context).primaryColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
