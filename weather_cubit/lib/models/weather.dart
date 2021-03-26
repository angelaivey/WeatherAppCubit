class Weather{
  final temp;
  final pressure;
  final  humidity;
  final temp_max;
  final  temp_min;


  double get getTemp => temp-272.5;
  double get getMaxTemp => temp_max-272.5;
  double get getMinTemp=> temp_min -272.5;

  Weather(this.temp, this.pressure, this.humidity, this.temp_max, this.temp_min);

  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
        json["temp"],
        json["pressure"],
        json["humidity"],
        json["temp_max"],
        json["temp_min"]
    );
  }

  get cityName => null;
}






// import 'package:meta/meta.dart';
//
// import 'package:meta/meta.dart';
//
// class Weather {
//   final String cityName;
//   final double temperatureCelsius;
//
//   Weather({
//     @required this.cityName,
//     @required this.temperatureCelsius,
//   });
//
//   @override
//   bool operator ==(Object o) {
//     if (identical(this, o)) return true;
//
//     return o is Weather &&
//         o.cityName == cityName &&
//         o.temperatureCelsius == temperatureCelsius;
//   }
//
//   @override
//   int get hashCode => cityName.hashCode ^ temperatureCelsius.hashCode;
// }