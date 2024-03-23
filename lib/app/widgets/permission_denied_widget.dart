import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/animations/play_lottie.dart';
import '../../core/common/common.dart';
import '../../core/utils/utils.dart';
import '../bloc/location/location_bloc.dart';

class PermissionDeniedWidget extends StatelessWidget {
  const PermissionDeniedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PrimaryButton(
        onTap: () => context.read<LocationBloc>().add(RetryPermissionEvent()),
        isBorder: true,
        color: AppColors.white,
        text: "Location Permission",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlayLottie(
                  lottie: AppLottie.locationNotFound,
                  isPlayBackAndForward: true),
              Text(
                  "The app requires access to your location in order to provide accurate weather information.\n Please enable location services to enjoy the app's full functionality.",
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
