import 'package:bloc/bloc.dart';
import 'package:weather_cubit/bloc/weather_bloc.dart';
import 'package:weather_cubit/models/weather.dart';
import 'package:weather_cubit/weather_repository.dart';
import 'package:meta/meta.dart';

//part '../weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  //add a weather repo dependency
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(WeatherInitial());

  //implement get weather method
  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weather = await _weatherRepository.getWeather(cityName);
      emit(WeatherLoaded(weather));
    } on StackTrace {
      emit(WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}