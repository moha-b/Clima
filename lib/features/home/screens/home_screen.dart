import 'package:elemental/app/bloc/theme/theme_cubit.dart';
import 'package:elemental/core/constant/constants.dart';
import 'package:elemental/features/home/cubit/home_cubit.dart';
import 'package:elemental/features/home/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is HomeSuccessState) {
          BlocProvider.of<ThemeCubit>(context).switchTheme(isNight);
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

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.cityName,
    required this.time,
    required this.weatherState,
    required this.temperature,
    required this.image,
  });
  final String cityName;
  final String time;
  final String weatherState;
  final String temperature;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TimeAndLocation(
                      date: time,
                      cityName: cityName,
                    ),
                  ),
                  const Icon(Iconsax.location),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: WeatherImage(
                image: image,
              ),
            ),
            Expanded(
              flex: 2,
              child: WeatherStatus(
                temperature: temperature,
                weatherState: weatherState,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
