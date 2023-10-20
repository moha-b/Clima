// import 'package:elemental/core/constant/constants.dart';
// import 'package:elemental/core/helper/converter_helper.dart';
// import 'package:elemental/core/services/api_service.dart';
// import 'package:elemental/core/utils/app_images.dart';
// import 'package:elemental/features/home/data/model/weather_model.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
//
// part 'home_state.dart';
//
// class HomeCubit extends Cubit<HomeState> {
//   ApiService apiService;
//   HomeCubit(this.apiService) : super(const HomeState());
//
//   getWeatherToday({
//     required double? latitude,
//     required double? longitude,
//   }) async {
//     try {
//       WeatherModel weatherData = await apiService.fetchWeatherData(
//           endPoint: "?lat=$latitude&lon=$longitude");
//
//       // emit successful state
//       emit(HomeState(
//         weatherData: weatherData,
//         todayDate: todayDate,
//         temperature: temperature,
//         weatherImage: imagePath,
//       ));
//     } catch (e) {
//       // Handle error if needed, but do not emit any error state here
//       print("Error: $e");
//     }
//   }
// }
