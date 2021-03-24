import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_cubit/weather_repository.dart';
import 'package:weather_cubit/models/weather.dart';

part 'weather_state.dart';
part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
      WeatherEvent event,
      ) async* {
    if (event is GetWeather) {
      try {
        yield WeatherLoading();
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkException {
        yield WeatherError("Couldn't fetch weather. Is the device online?");
      }
    }
  }
}