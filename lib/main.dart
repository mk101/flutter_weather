import 'package:flutter/material.dart';
import 'package:weather/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF7D64FF, <int, Color>{
          50: Color(0xFF7D64FF),
          100: Color(0xFF7D64FF),
          200: Color(0xFF7D64FF),
          300: Color(0xFF7D64FF),
          400: Color(0xFF7D64FF),
          500: Color(0xFF7D64FF),
          600: Color(0xFF7D64FF),
          700: Color(0xFF7D64FF),
          800: Color(0xFF7D64FF),
          900: Color(0xFF7D64FF),

        }),
      ),
      home: HomePage(title: 'Weather'),
    );
  }
}
