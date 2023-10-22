import 'package:elemental/app/widgets/permission_denied_widget.dart';
import 'package:elemental/app/widgets/waiting_permission_widget.dart';
import 'package:elemental/core/utils/utils.dart';
import 'package:elemental/features/landing_page/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/location/location_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimensions.config(context);
    return BlocProvider(
      create: (context) => LocationBloc()..add(GetLocationEvent()),
      child: BlocConsumer<LocationBloc, LocationState>(
        listener: (context, state) {
          // todo: anything
          if (state is FetchCurrentLocationState) {
            print(state.latitude);
            print(state.longitude);
          }
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
    );
  }
}
