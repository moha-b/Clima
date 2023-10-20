import 'package:elemental/app/cubit/app_cubit.dart';
import 'package:elemental/core/constant/constants.dart';
import 'package:elemental/core/helper/cach_helper.dart';
import 'package:elemental/core/services/api_service.dart';
import 'package:elemental/core/services/get_it_service.dart';
import 'package:elemental/core/utils/utils.dart';
import 'package:elemental/features/home/screens/widgets/widgets.dart';
import 'package:elemental/features/landing_page/bloc/nav_bar_bloc.dart';
import 'package:elemental/features/landing_page/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/helper/functions.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimensions.config(context);
    CacheHelper.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AppCubit(getIt.get<ApiService>())..getCurrentLocation(),
        ),
        BlocProvider(
          create: (context) => NavBarBloc(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is AppStarted) {
            weatherModel = state.weatherModel;
            latitude = context.read<AppCubit>().latitude;
            longitude = context.read<AppCubit>().longitude;
            isNight = isNightTime(
                weatherModel!.sys.sunrise, weatherModel!.sys.sunset);
          }
        },
        builder: (context, state) {
          if (state is AppInitial) {
            return MaterialApp(
              title: "Elemental",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  scaffoldBackgroundColor: AppColors.dark,
                  brightness: Brightness.dark),
              home: StateWidget(lottie: state.lottie, text: state.text),
            );
          } else if (state is AppStarted) {
            return MaterialApp(
              title: "Elemental",
              debugShowCheckedModeBanner: false,
              theme: isNight ? AppThemes.dark : AppThemes.light,
              home: const LandingScreen(),
            );
          } else if (state is AppFailure) {
            return MaterialApp(
              title: "Elemental",
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  scaffoldBackgroundColor: AppColors.dark,
                  brightness: Brightness.dark),
              home: StateWidget(lottie: state.lottie, text: state.error),
            );
          } else {
            return const MaterialApp(
              home: Text(""),
            );
          }
        },
      ),
    );
  }
}
