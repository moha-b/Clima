import 'package:clima/core/common/failure_widget.dart';
import 'package:clima/core/common/loading_widget.dart';
import 'package:clima/features/forecast_5_days/cubit/forecast_5_days_cubit.dart';
import 'package:clima/features/forecast_5_days/screens/widgets/forecast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Forecast5DaysScreen extends StatelessWidget {
  const Forecast5DaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Forecast5DaysCubit, Forecast5DaysState>(
      builder: (context, state) {
        if (state is Forecast5DaysInitial) {
          return const LoadingWidget();
        } else if (state is Forecast5DaysLoaded) {
          return ForecastWidget(forecast: state.forecast);
        } else if (state is Forecast5DaysError) {
          return FailureWidget(text: state.errorMessage);
        } else {
          return const FailureWidget();
        }
      },
    );
  }
}
