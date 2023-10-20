import 'package:elemental/features/landing_page/widgets/bottom_nav_bar_list.dart';
import 'package:elemental/features/landing_page/widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/nav_bar_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavBarBloc, NavBarState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: screens.elementAt(state.tabIndex),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              BlocProvider.of<NavBarBloc>(context)
                  .add(TabChange(tabIndex: index));
            },
            currentIndex: state.tabIndex,
            items: bottomNavItems,
          ),
        );
      },
    );
  }
}
