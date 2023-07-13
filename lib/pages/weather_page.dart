import 'package:flutter/material.dart';
import 'package:weather_app/widgets/body_main.dart';
import '/widgets/app_bar.dart';
import '/widgets/body_bottom.dart';

class WeatherPage extends StatefulWidget {
  final String title;

  const WeatherPage({super.key, required this.title});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const WeatherAppBar(),
      body: Stack(
        children: [
          Image.asset(
            'assets/sunny.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.black38
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyMain(),
                BodyBottom(),
              ],
            ),
          )],
      ),
    );
  }
}