import 'package:flutter/material.dart';
import 'package:weather_app/widgets/app_bar.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralAppBar(),
      body: Center(
        child: Text('Im the Forecast page'),
      ),
    );
  }
}