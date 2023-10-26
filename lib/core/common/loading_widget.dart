import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_images.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AppLottie.loadingWeather),
          const Text("Loading..."),
        ],
      ),
    );
  }
}
