part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
  List<Object> get props => [];
}

class ChangeThemeEvent extends AppEvent {
  final ThemeMode theme;

  const ChangeThemeEvent(this.theme);

  @override
  List<Object> get props => [theme];
}

class GetLocationEvent extends AppEvent {}

class RetryPermissionEvent extends AppEvent {}
