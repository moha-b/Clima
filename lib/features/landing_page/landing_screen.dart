import 'package:clima/core/services/get_it_service.dart';
import 'package:clima/features/daily_forecast/cubit/daily_forecast_cubit.dart';
import 'package:clima/features/daily_forecast/data/repo/daily_forecast_repo.dart';
import 'package:clima/features/home/cubit/home_cubit.dart';
import 'package:clima/features/home/data/repo/home_repo.dart';
import 'package:clima/features/hourly_forecast/cubit/hourly_forecast_cubit.dart';
import 'package:clima/features/landing_page/widgets/bottom_nav_bar_list.dart';
import 'package:clima/features/landing_page/widgets/permission_denied_widget.dart';
import 'package:clima/features/landing_page/widgets/screens.dart';
import 'package:clima/features/landing_page/widgets/waiting_permission_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/location/location_bloc.dart';
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
          create: (context) => LocationBloc()..add(GetLocationEvent()),
        ),
        BlocProvider(
          create: (context) =>
              HomeCubit(getIt.get<HomeRepository>())..getTodayWeather(),
        ),
        BlocProvider(
          create: (context) =>
              DailyForecastCubit(getIt.get<DailyForecastRepository>())
                ..fetchForecast5DaysData(),
        ),
        BlocProvider(
          create: (context) =>
              HourlyForecastCubit(getIt.get<DailyForecastRepository>())
                ..fetchForecast5DaysData(),
        ),
      ],
      child: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is AskForLocationPermissionState) {
            return const WaitingPermissionWidget();
          } else if (state is LocationPermissionDeniedState) {
            return const PermissionDeniedWidget();
          } else if (state is FetchCurrentLocationState) {
            return BlocBuilder<NavBarBloc, NavBarState>(
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
            );
          } else {
            return const Scaffold(
              body: Center(
                child: Text("Unhandled Error"),
              ),
            );
          }
        },
      ),
    );
  }

  void fetchData(BuildContext context) async {
    BlocProvider.of<DailyForecastCubit>(context).fetchForecast5DaysData();
    BlocProvider.of<HourlyForecastCubit>(context).fetchForecast5DaysData();
    BlocProvider.of<HomeCubit>(context).getTodayWeather();
  }
}
