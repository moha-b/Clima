import 'package:flutter/material.dart';

class AppDimensions {
  static double? height;
  static double? width;

  static config(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}
