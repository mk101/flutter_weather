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
          500: Color(0xFF7D64FF)
        }),
      ),
      home: HomePage(title: 'Weather'),
    );
  }
}
