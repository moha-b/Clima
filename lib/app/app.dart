import 'package:elemental/app/bloc/theme/theme_cubit.dart';
import 'package:elemental/app/widgets/permission_denied_widget.dart';
import 'package:elemental/app/widgets/waiting_permission_widget.dart';
import 'package:elemental/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/landing_page/landing_screen.dart';
import 'bloc/location/location_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimensions.config(context);
    return MultiBlocProvider(
      providers: [
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
            title: "Elemental",
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                if (state is AskForLocationPermissionState) {
                  return const WaitingPermissionWidget();
                } else if (state is LocationPermissionDeniedState) {
                  return const PermissionDeniedWidget();
                } else if (state is FetchCurrentLocationState) {
                  return LandingScreen(
                    lat: state.latitude,
                    lon: state.longitude,
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
        },
      ),
    );
  }
}

/*
* BlocConsumer<LocationBloc, LocationState>(
        listener: (context, state) {
          // todo: anything
        },
        builder: (context, state) {
          if (state is AskForLocationPermissionState) {
            return WaitingPermissionWidget(
              lottie: state.lottie,
              text: state.text,
            );
          } else if (state is LocationPermissionDeniedState) {
            return PermissionDeniedWidget(
              lottie: state.lottie,
              text: state.text,
            );
          } else if (state is FetchCurrentLocationState) {
            return MaterialApp(
              title: "Elemental",
              debugShowCheckedModeBanner: false,
              darkTheme: AppThemes.dark,
              theme: AppThemes.light,
              home: LandingScreen(
                lat: state.latitude,
                lon: state.longitude,
              ),
            );
          } else {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text("Unhandled Error"),
                ),
              ),
            );
          }
        },
      ),
*/
