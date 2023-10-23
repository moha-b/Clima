import 'package:elemental/app/bloc/network/network_cubit.dart';
import 'package:elemental/app/bloc/theme/theme_cubit.dart';
import 'package:elemental/core/utils/utils.dart';
import 'package:elemental/features/home/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/landing_page/landing_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimensions.config(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => NetworkCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: "Elemental",
            theme: theme,
            debugShowCheckedModeBanner: false,
            home: BlocBuilder<NetworkCubit, NetworkState>(
              builder: (context, state) {
                if (state is ConnectedInitial) {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                } else if (state is ConnectedSuccess) {
                  return const LandingScreen();
                } else {
                  return const Scaffold(
                    body: StateWidget(
                      lottie: AppLottie.noInternet,
                      text: "No Internet",
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
