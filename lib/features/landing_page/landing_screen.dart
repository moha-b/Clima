import 'package:clima/core/services/get_it_service.dart';
import 'package:clima/features/forecast_5_days/cubit/forecast_5_days_cubit.dart';
import 'package:clima/features/forecast_5_days/data/repo/forecast_5_days_repo.dart';
import 'package:clima/features/home/cubit/home_cubit.dart';
import 'package:clima/features/home/data/repo/home_repo.dart';
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
          create: (context) => HomeCubit(getIt.get<HomeRepository>()),
        ),
        BlocProvider(
          create: (context) =>
              Forecast5DaysCubit(getIt.get<Forecast5DaysRepository>()),
        ),
      ],
      child: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is AskForLocationPermissionState) {
            return const WaitingPermissionWidget();
          } else if (state is LocationPermissionDeniedState) {
            return const PermissionDeniedWidget();
          } else if (state is FetchCurrentLocationState) {
            BlocProvider.of<HomeCubit>(context).getTodayWeather(
              latitude: state.latitude,
              longitude: state.longitude,
            );
            BlocProvider.of<Forecast5DaysCubit>(context).fetchForecast5DaysData(
              lat: state.latitude,
              lon: state.longitude,
            );

            return BlocBuilder<NavBarBloc, NavBarState>(
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
}
