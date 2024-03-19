import 'package:clima/core/caching/caching_helper.dart';
import 'package:clima/core/helper/lotte_cach_helper.dart';
import 'package:clima/core/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  Bloc.observer = MyBlocObserver();
  await Future.wait([
    CacheHelper.init(),
    LottieCache.cache(),
    NotificationService.initialize(),
  ]);
}
