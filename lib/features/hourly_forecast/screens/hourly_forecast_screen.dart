import 'package:clima/core/common/failure_widget.dart';
import 'package:clima/core/common/loading_widget.dart';
import 'package:clima/features/hourly_forecast/cubit/hourly_forecast_cubit.dart';
import 'package:clima/features/hourly_forecast/screens/widgets/hourly_forecast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HourlyForecastScreen extends StatelessWidget {
  const HourlyForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HourlyForecastCubit, HourlyForecastState>(
      builder: (context, state) {
        if (state is HourlyForecastInitial) {
          return const LoadingWidget();
        } else if (state is HourlyForecastError) {
          return FailureWidget(text: state.errorMessage);
        } else if (state is HourlyForecastLoaded) {
          return HourlyForecastWidget(forecast: state.forecast);
        } else {
          return const Center(child: Text("Something Wrong"));
        }
      },
    );
  }
}
