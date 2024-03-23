import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/animations/play_lottie.dart';
import '../../core/common/common.dart';
import '../../core/utils/utils.dart';
import '../bloc/location/location_bloc.dart';

class LocationServiceDisabledWidget extends StatelessWidget {
  const LocationServiceDisabledWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PrimaryButton(
        onTap: () =>
            context.read<LocationBloc>().add(EnableLocationServiceEvent()),
        isBorder: true,
        color: AppColors.white,
        text: "Enable Location",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlayLottie(
                  lottie: AppLottie.locationService,
                  isPlayBackAndForward: true),
              Text(
                  "Hey! 🌦️ Boost your weather app experience—enable location services for hyper-local forecasts! 🌍📱",
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
