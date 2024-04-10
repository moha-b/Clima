import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/utils.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppThemes.basic);

  void switchTheme(bool isDay) {
    if (isDay) {
      emit(AppThemes.light);
    } else {
      emit(AppThemes.dark);
    }
  }
}
