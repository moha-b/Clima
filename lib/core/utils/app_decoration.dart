import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration container(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Theme.of(context).focusColor,
    );
  }
}
