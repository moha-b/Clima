import 'package:clima/app/bloc/theme/theme_cubit.dart';
import 'package:clima/core/common/common.dart';
import 'package:clima/core/managers/notification_service.dart';
import 'package:clima/features/home/cubit/home_cubit.dart';
import 'package:clima/features/home/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) async {
        if (state is HomeSuccessState) {
          BlocProvider.of<ThemeCubit>(context).switchTheme(state.weather.isDay);
          await NotificationService.scheduleNotifications(
            body: state.weather.temperature.toString(),
            imageAssetPath: state.weather.theme.image,
          );
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const LoadingWidget();
        } else if (state is HomeSuccessState) {
          return HomeWidget(weather: state.weather);
        } else if (state is HomeErrorState) {
          return FailureWidget(text: state.error);
        } else {
          return const Center(
            child: Text(
              "Bankai",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          );
        }
      },
    );
  }
}
