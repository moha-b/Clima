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
          return Center(child: Text(""));
        } else if (state is HourlyForecastError) {
          return Center(child: Text(""));
        } else if (state is HourlyForecastLoaded) {
          return HourlyForecastWidget(forecast: state.forecast);
        } else {
          return Center(child: Text(""));
        }
      },
    );
  }
}
