import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/GetWeatherCubit/GetWeatherStates.dart';
import 'package:weatherapp/Model/WeatherModel.dart';
import 'package:weatherapp/Services/WeatherService.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
   late WeatherModel weatherModel;

  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService().getWeather(city: cityName);
      emit(WeatherState());
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
