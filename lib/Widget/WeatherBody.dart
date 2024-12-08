import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/Cubits/GetWeatherCubit/GetWeatherCubit.dart';
import 'package:weatherapp/Model/WeatherModel.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.city,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'update at : ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network("https:${weatherModel.image!}"),
                Text(weatherModel.Temp.toString(), style: TextStyle(fontSize: 30)),
                Column(
                  children: [
                    Text(
                      'maxTemp :${weatherModel.maxTemp.round()}',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'minTemp :${weatherModel.minTemp.round()}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              '${weatherModel.WeatherCondition}',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
