import 'package:flutter/material.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text("Weak Forecast"),
          pinned: true,
        ),
      ],
    );
  }
}
