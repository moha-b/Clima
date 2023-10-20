import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  NavBarBloc() : super(const NavBarInitial(tabIndex: 0)) {
    on<NavBarEvent>((event, emit) {
      if (event is TabChange) {
        emit(NavBarInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
