import 'package:clima/core/helper/location_helper.dart';
import 'package:clima/core/helper/lotte_cach_helper.dart';
import 'package:clima/core/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../services/get_it_service.dart';
import 'bloc_observer.dart';

T isNotNull<T>(T variable) {
  return variable ?? -1 as T;
}

num calculateAverage(dynamic value1, dynamic value2) {
  return (isNotNull(value1) + isNotNull(value2)) ~/ 2;
}

bool isNull(dynamic object, String property) {
  List<String> propertyParts = property.split('.');
  dynamic currentObject = object;

  for (String part in propertyParts) {
    if (currentObject == null) {
      return true;
    }

    if (currentObject is Map) {
      currentObject = currentObject[part];
    } else if (currentObject is List) {
      int? index = int.tryParse(part);
      if (index != null && index >= 0 && index < currentObject.length) {
        currentObject = currentObject[index];
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
  return false;
}

initialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocationHelper.instance.getPositionDetails(
      currentPosition: await LocationHelper.instance.getLatLong());
  await NotificationService.initialize();
  setup();
  Bloc.observer = MyBlocObserver();
  await LottieCache.cache();
  await dotenv.load(fileName: "assets/env/api.env");
}
