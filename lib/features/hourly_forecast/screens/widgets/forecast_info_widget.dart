import 'package:clima/core/utils/utils.dart';
import 'package:flutter/material.dart';

class ForecastInfoWidget extends StatelessWidget {
  const ForecastInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height! * 0.18,
      margin: EdgeInsets.only(
        left: AppDimensions.width! * 0.03,
        right: AppDimensions.width! * 0.03,
        top: AppDimensions.height! * 0.02,
      ),
      padding: const EdgeInsets.all(16),
      decoration: AppDecoration.container(context),
      child: Row(
        children: List.generate(
          3,
          (index) => Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.wind_power_outlined),
                Text("Wind", style: AppTypography.bold14()),
                Text("5 km/h"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
