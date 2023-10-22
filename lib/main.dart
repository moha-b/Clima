import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/helper/bloc_observer.dart';
import 'core/services/get_it_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}
