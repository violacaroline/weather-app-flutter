import 'package:flutter/material.dart';
import 'package:weather_app/widgets/app_bar.dart';
import 'package:weather_app/widgets/weather_forecast.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: WeatherForecast(),
          ),
        ],
      ),
    );
  }
}