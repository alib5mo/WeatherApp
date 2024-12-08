import 'package:dio/dio.dart';
import 'package:weatherapp/Model/WeatherModel.dart';

class WeatherService {
  final dio = Dio();
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '92f3662543f24d98b61224235242811';

  Future<WeatherModel> getWeather({required String city}) async {
    try {
      final response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$city&days=10&aqi=no&alerts=no');
      //السطر ده علشان اجيب الdata بتاعتى بعمل object من الmodel الى عملته بالطريقه دى
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      //هعمل return للobject
      return weatherModel;
    } on DioException catch (e) {
      throw Exception(e.response?.data['error']['message'] ?? 'oops');
    }
  }
}
