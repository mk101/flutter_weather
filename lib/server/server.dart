import 'package:weather/weather/weather.dart';

abstract class Server {

  Weather getCurrentWeather(String name);

  List<Weather> getWeatherForNextWeek(String name);

  List<String> getCities();

  String curCity;
  bool isC;

}