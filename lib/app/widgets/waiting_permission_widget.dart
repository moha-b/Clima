import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_images.dart';

class WaitingPermissionWidget extends StatelessWidget {
  const WaitingPermissionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AppImages.fetchLocation, fit: BoxFit.cover),
              const Text("Looking for your location"),
            ],
          ),
        ),
      ),
    );
  }
}
