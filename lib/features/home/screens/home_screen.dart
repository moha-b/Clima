import 'package:clima/app/bloc/theme/theme_cubit.dart';
import 'package:clima/core/global/variables.dart';
import 'package:clima/core/services/notification_service.dart';
import 'package:clima/features/home/cubit/home_cubit.dart';
import 'package:clima/features/home/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is HomeSuccessState) {
          BlocProvider.of<ThemeCubit>(context)
              .switchTheme(GlobalVariablesState.isNight);
          NotificationService.scheduleSunriseSunsetNotifications(
              title: "Today's weather in ${state.weatherData.cityName}",
              body: "${state.temperature} • ${state.weatherData.weatherState}",
              sunriseTime: state.weatherData.sys.sunrise.toInt(),
              sunsetTime: state.weatherData.sys.sunset.toInt(),
              imageAssetPath: state.weatherImage);
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return StateWidget(lottie: state.lottie, text: state.text);
        } else if (state is HomeSuccessState) {
          return HomeWidget(
            temperature: state.temperature,
            time: state.todayDate,
            weatherState: state.weatherData.weatherState,
            cityName: state.weatherData.cityName,
            image: state.weatherImage,
            textColor: state.textColor,
          );
        } else if (state is HomeErrorState) {
          return StateWidget(text: state.error);
        } else {
          return const StateWidget();
        }
      },
    );
  }
}
