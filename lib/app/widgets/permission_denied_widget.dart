import 'package:elemental/app/bloc/location/location_bloc.dart';
import 'package:elemental/core/common/primary_button.dart';
import 'package:elemental/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/animations/play_lottie.dart';
import '../../core/utils/app_images.dart';

class PermissionDeniedWidget extends StatelessWidget {
  const PermissionDeniedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: PrimaryButton(
        onTap: () {
          context.read<LocationBloc>().add(RetryPermissionEvent());
        },
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
