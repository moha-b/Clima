import 'package:clima/core/common/common.dart';
import 'package:clima/features/daily_forecast/cubit/daily_forecast_cubit.dart';
import 'package:clima/features/daily_forecast/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyForecastScreen extends StatelessWidget {
  const DailyForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyForecastCubit, DailyForecastState>(
      builder: (context, state) {
        if (state is DailyForecastInitial) {
          return const LoadingWidget();
        } else if (state is DailyForecastSuccess) {
          return DailyForecastWidget(weatherModel: state.dailyWeather);
        } else if (state is DailyForecastFailure) {
          return FailureWidget(text: state.message);
        }
        return const Center(
          child: Text("BANKAI"),
        );
      },
    );
  }
}
