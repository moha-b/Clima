import 'package:clima/app/bloc/app_bloc.dart';
import 'package:clima/app/bloc/bloc.dart';
import 'package:clima/app/widgets/widgets.dart';
import 'package:clima/core/navigation/navigation.dart';
import 'package:clima/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/landing_page/landing_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppDimensions.config(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBloc()),
        BlocProvider(
          create: (context) => LocationBloc()..add(GetLocationEvent()),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: "Clima",
            theme: theme,
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationHelper.navigatorKey,
            onGenerateRoute: NavigationHelper.generateRoute,
            navigatorObservers: [NavigationHelper.routeObserver],
            home: BlocBuilder<LocationBloc, LocationState>(
              builder: (BuildContext context, LocationState state) {
                if (state is AskForLocationPermissionState) {
                  return const WaitingPermissionWidget();
                } else if (state is LocationPermissionDeniedState) {
                  return const PermissionDeniedWidget();
                } else if (state is LocationServiceDisabledState) {
                  return const LocationServiceDisabledWidget();
                } else if (state is FetchCurrentLocationState) {
                  return const LandingScreen();
                } else {
                  return const Scaffold(
                    body: Center(
                      child: Text("Unexpected Error"),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
