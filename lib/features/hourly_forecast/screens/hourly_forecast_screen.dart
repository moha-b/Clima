import 'package:clima/core/common/failure_widget.dart';
import 'package:clima/core/common/loading_widget.dart';
import 'package:clima/features/hourly_forecast/screens/widgets/hourly_forecast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../daily_forecast/cubit/detailed_forecast_cubit.dart';

class HourlyForecastScreen extends StatelessWidget {
  const HourlyForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailedForecastCubit, DetailedForecastState>(
      builder: (context, state) {
        if (state is DetailedForecastInitial) {
          return const LoadingWidget();
        } else if (state is DetailsForecastSuccess) {
          return HourlyForecastWidget(forecast: state.hourlyForecast);
        } else if (state is DetailedForecastError) {
          return FailureWidget(text: state.errorMessage);
        } else {
          return const FailureWidget();
        }
      },
    );
  }
}
