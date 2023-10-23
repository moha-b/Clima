import 'package:clima/core/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppThemes.basic);

  void switchTheme(bool isNight) {
    if (isNight) {
      emit(AppThemes.dark);
    } else {
      emit(AppThemes.light);
    }
  }
}
