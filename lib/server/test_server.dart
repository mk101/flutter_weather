import 'package:weather/server/server.dart';
import 'package:weather/weather/weather.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestServer implements Server {
  static final _server = TestServer._internal();

  factory TestServer() {
    return _server;
  }
  TestServer._internal();

  @override
  Weather getCurrentWeather(String name) {
    switch(name) {
      case 'Moscow':
        return new Weather('Cloudy', -6, -9);
      case 'St. Peterburg':
        return new Weather('Rainy', -4, -5);
      case 'N. Novgorod':
        return new Weather('Sunny', -7, -10);
      default:
        Fluttertoast.showToast(msg: 'Can\'t find location');
        return Weather.getDefault();
    }
  }

  @override
  List<Weather> getWeatherForNextWeek(String name) {
    switch(name) {
      case 'Moscow':
        return <Weather>[
          new Weather('Cloudy', -6, -9),
          new Weather('Sunny', -4, -6),
          new Weather('Cloudy', -7, -9),
          new Weather('Rainy', -8, -10),
          new Weather('Sunny', -5, -6),
          new Weather('Sunny', -4, -5),
          new Weather('Cloudy', -6, -9)
        ];
      case 'St. Peterburg':
        return <Weather>[
          new Weather('Rainy', -5, -7),
          new Weather('Sunny', -4, -6),
          new Weather('Sunny', -4, -6),
          new Weather('Rainy', -8, -10),
          new Weather('Cloudy', -7, -9),
          new Weather('Sunny', -4, -5),
          new Weather('Rainy', -7, -9)
        ];
      case 'N. Novgorod':
        return <Weather>[
          new Weather('Cloudy', -6, -9),
          new Weather('Cloudy', -6, -8),
          new Weather('Sunny', -5, -9),
          new Weather('Rainy', -8, -10),
          new Weather('Cloudy', -6, -7),
          new Weather('Sunny', -4, -5),
          new Weather('Cloudy', -6, -9)
        ];
      default:
        Fluttertoast.showToast(msg: 'Can\'t find location');
        return <Weather>[
          Weather.getDefault(),
          Weather.getDefault(),
          Weather.getDefault(),
          Weather.getDefault(),
          Weather.getDefault(),
          Weather.getDefault(),
          Weather.getDefault()
        ];
    }
  }

}