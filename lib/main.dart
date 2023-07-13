import 'package:flutter/material.dart';
import 'pages/weather_page.dart';


void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Weather App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const WeatherPage(title: 'Weather App'),
    );
  }
}


