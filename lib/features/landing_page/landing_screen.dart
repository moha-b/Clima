import 'package:elemental/core/services/get_it_service.dart';
import 'package:elemental/features/home/cubit/home_cubit.dart';
import 'package:elemental/features/home/data/repo/home_repo.dart';
import 'package:elemental/features/landing_page/widgets/bottom_nav_bar_list.dart';
import 'package:elemental/features/landing_page/widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/nav_bar_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key, required this.lat, required this.lon});

  final double? lat;
  final double? lon;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarBloc(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(getIt.get<HomeRepository>())
            ..getTodayWeather(latitude: lat, longitude: lon),
        ),
      ],
      child: BlocBuilder<NavBarBloc, NavBarState>(
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
      ),
    );
  }
}
