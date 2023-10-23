part of 'nav_bar_bloc.dart';

@immutable
abstract class NavBarEvent {}

class TabChange extends NavBarEvent {
  final int tabIndex;

  TabChange({required this.tabIndex});
}
