import 'package:elemental/core/constant/constants.dart';
import 'package:elemental/core/helper/functions.dart';
import 'package:elemental/features/home/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TimeAndLocation(
                      date: convertTimeToText(weatherModel!.time),
                      cityName: weatherModel!.cityName,
                    ),
                  ),
                  const Icon(Iconsax.location),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: WeatherImage(
                image: getImagePath(weatherModel!.weatherState),
              ),
            ),
            Expanded(
              flex: 2,
              child: WeatherStatus(
                temperature:
                    convertTemperatureToCelsius(weatherModel!.temperature),
                weatherState: weatherModel!.weatherState,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
