import 'package:weather/server/server.dart';
import 'package:weather/weather/weather.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather/assets/string.dart';

class TestServer implements Server {
  static final _server = TestServer._internal();

  factory TestServer() {
    return _server;
  }
  TestServer._internal();

  @override
  Weather getCurrentWeather(String name) {
    switch(name) {
      case 'MOS':
        return new Weather('CLOUDY', -6, -9);
      case 'SPB':
        return new Weather('RAINY', -4, -5);
      case 'NNOV':
        return new Weather('SUNNY', -7, -10);
      default:
        Fluttertoast.showToast(msg: Strings.getValue('CANTFNDLOC'));
        return Weather.getDefault();
    }
  }

  @override
  List<Weather> getWeatherForNextWeek(String name) {
    switch(name) {
      case 'MOS':
        return <Weather>[
          new Weather('CLOUDY', -6, -9),
          new Weather('SUNNY', -4, -6),
          new Weather('CLOUDY', -7, -9),
          new Weather('RAINY', -8, -10),
          new Weather('SUNNY', -5, -6),
          new Weather('SUNNY', -4, -5),
          new Weather('CLOUDY', -6, -9)
        ];
      case 'SPB':
        return <Weather>[
          new Weather('RAINY', -5, -7),
          new Weather('SUNNY', -4, -6),
          new Weather('SUNNY', -4, -6),
          new Weather('RAINY', -8, -10),
          new Weather('CLOUDY', -7, -9),
          new Weather('SUNNY', -4, -5),
          new Weather('RAINY', -7, -9)
        ];
      case 'NNOV':
        return <Weather>[
          new Weather('CLOUDY', -6, -9),
          new Weather('CLOUDY', -6, -8),
          new Weather('SUNNY', -5, -9),
          new Weather('RAINY', -8, -10),
          new Weather('CLOUDY', -6, -7),
          new Weather('SUNNY', -4, -5),
          new Weather('CLOUDY', -6, -9)
        ];
      default:
        Fluttertoast.showToast(msg: Strings.getValue('CANTFNDLOC'));
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

  @override
  List<String> getCities() {
    return [
      'MOS',
      'SPB',
      'NNOV'
    ];
  }

  @override String curCity = 'MOS';

  @override bool isC = true;

}