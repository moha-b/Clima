import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WaitingPermissionWidget extends StatelessWidget {
  const WaitingPermissionWidget(
      {super.key, required this.lottie, required this.text});
  final String lottie;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(lottie, fit: BoxFit.cover),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
