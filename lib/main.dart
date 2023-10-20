import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/services/get_it_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}
