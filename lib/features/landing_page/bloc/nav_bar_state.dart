part of 'nav_bar_bloc.dart';

@immutable
abstract class NavBarState {
  final int tabIndex;

  const NavBarState({required this.tabIndex});
}

class NavBarInitial extends NavBarState {
  const NavBarInitial({required super.tabIndex});
}
