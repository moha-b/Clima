import 'package:clima/core/common/failure_widget.dart';
import 'package:clima/core/common/loading_widget.dart';
import 'package:clima/features/daily_forecast/cubit/daily_forecast_cubit.dart';
import 'package:clima/features/daily_forecast/screens/widgets/forecast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Forecast5DaysScreen extends StatelessWidget {
  const Forecast5DaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyForecastCubit, DailyForecastState>(
      builder: (context, state) {
        if (state is DailyForecastInitial) {
          return const LoadingWidget();
        } else if (state is DailyForecastLoaded) {
          return ForecastWidget(forecast: state.forecast);
        } else if (state is DailyForecastError) {
          return FailureWidget(text: state.errorMessage);
        } else {
          return const FailureWidget();
        }
      },
    );
  }
}
