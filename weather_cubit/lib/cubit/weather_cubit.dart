import 'package:bloc/bloc.dart';
import 'package:weather_cubit/bloc/weather_bloc.dart';
import 'package:weather_cubit/models/weather.dart';
import 'package:weather_cubit/weather_repository.dart';
import 'package:meta/meta.dart';

//part '../weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}