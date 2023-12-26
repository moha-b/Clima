import 'package:clima/core/common/failure_widget.dart';
import 'package:clima/core/common/loading_widget.dart';
import 'package:clima/features/daily_forecast/cubit/detailed_forecast_cubit.dart';
import 'package:clima/features/daily_forecast/screens/widgets/forecast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Forecast5DaysScreen extends StatelessWidget {
  const Forecast5DaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailedForecastCubit, DetailedForecastState>(
      builder: (context, state) {
        if (state is DetailedForecastInitial) {
          return const LoadingWidget();
        } else if (state is DetailsForecastSuccess) {
          return ForecastWidget(forecast: state.dailyForecast);
        } else if (state is DetailedForecastError) {
          return FailureWidget(text: state.errorMessage);
        } else {
          return const FailureWidget();
        }
      },
    );
  }
}
