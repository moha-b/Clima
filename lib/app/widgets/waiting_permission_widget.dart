import 'package:clima/core/animations/play_lottie.dart';
import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';

class WaitingPermissionWidget extends StatelessWidget {
  const WaitingPermissionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlayLottie(lottie: AppLottie.fetchLocation),
            Text("Looking for your location"),
          ],
        ),
      ),
    );
  }
}
