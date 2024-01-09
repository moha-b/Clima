import 'package:clima/core/utils/app_images.dart';
import 'package:lottie/lottie.dart';

class LottieCache {
  static final Map<String, LottieComposition> _compositions = {};

  /// Caches the given [LottieAsset]s.

  static Future<void> add(String assetName) async {
    _compositions[assetName] = await AssetLottie(assetName).load();
  }

  static cache() async {
    await add(AppLottie.fetchLocation);
    await add(AppLottie.locationNotFound);
    await add(AppLottie.noInternet);
    await add(AppLottie.loadingWeather);
    await add(AppLottie.failure);
  }
}
