import 'dart:math';
//
// import 'dart:math';
// import 'models/weather.dart';
//
// abstract class WeatherRepository {
//   /// Throws [NetworkException].
//   Future<Weather> fetchWeather(String cityName);
// }
//
// class FakeWeatherRepository implements WeatherRepository {
//   @override
//   Future<Weather> fetchWeather(String cityName) {
//     // Simulate network delay
//     return Future.delayed(
//       Duration(seconds: 1),
//           () {
//         final random = Random();
//
//         // Simulate some network exception
//         if (random.nextBool()) {
//           throw NetworkException();
//         }
//
//         // Return "fetched" weather
//         return Weather(
//           cityName: cityName,
//           // Temperature between 20 and 35.99
//           temperatureCelsius: 20 + random.nextInt(15) + random.nextDouble(),
//         );
//       },
//     );
//   }
// }
//
// class NetworkException implements Exception {}

import 'package:http/http.dart' as http;
import 'package:weather_cubit/models/weather.dart';
import 'dart:convert';

class WeatherRepository{
  Future<Weather> getWeather(String city) async{
    final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=60b7622316c19f2d0bfb9e473869a447");

    if(result.statusCode != 200)
      throw Exception();

    return parsedJson(result.body);
  }

  Weather parsedJson(final response){
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"]["name"];

    return Weather.fromJson(jsonWeather);
  }
}