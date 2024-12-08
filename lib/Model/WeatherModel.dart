class WeatherModel {
  final String city;
  final DateTime date;
  final String? image;
  final double maxTemp;
  final double minTemp;
  final double Temp;
   final String WeatherCondition;

  WeatherModel(
      {required this.city,
      required this.date,
      this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.Temp,
      required this.WeatherCondition});

  //ده الmodel  بتاع api الى تحت ده علشان اعرف اوصل للداتا جوه الapi
  //         اسم الكلاس
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      city: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      WeatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      Temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}
