import 'package:clima/core/services/get_it_service.dart';
import 'package:clima/features/daily_forecast/cubit/daily_forecast_cubit.dart';
import 'package:clima/features/daily_forecast/data/repo/daily_forecast_repo.dart';
import 'package:clima/features/home/cubit/home_cubit.dart';
import 'package:clima/features/home/data/repo/home_repo.dart';
import 'package:clima/features/hourly_forecast/data/repo/hourly_forecast_repo.dart';
import 'package:clima/features/landing_page/widgets/bottom_nav_bar_list.dart';
import 'package:clima/features/landing_page/widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../hourly_forecast/cubit/hourly_forecast_cubit.dart';
import 'bloc/nav_bar/nav_bar_bloc.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarBloc(),
        ),
        BlocProvider(
          create: (context) =>
              HomeCubit(getIt.get<HomeRepository>())..fetchWeatherData(),
        ),
        BlocProvider(
          create: (context) =>
              HourlyForecastCubit(getIt.get<HourlyForecastRepository>())
                ..fetchWeatherData(),
        ),
        BlocProvider(
          create: (context) =>
              DailyForecastCubit(getIt.get<DailyForecastRepository>())
                ..fetchDailyData(),
        ),
      ],
      child: BlocBuilder<NavBarBloc, NavBarState>(
        builder: (context, state) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async => fetchData(context),
              child: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: screens.elementAt(state.tabIndex),
                    )
                  ],
                ),
              ),
            ),
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

  void fetchData(BuildContext context) async {
    BlocProvider.of<HourlyForecastCubit>(context).fetchWeatherData();
    BlocProvider.of<HomeCubit>(context).fetchWeatherData();
  }
}
