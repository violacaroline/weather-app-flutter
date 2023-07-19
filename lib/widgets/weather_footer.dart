import 'package:flutter/material.dart';

import '../models/weather.dart';

class WeatherFooter extends StatefulWidget {
  final Weather currentWeather;

  const WeatherFooter({super.key, required this.currentWeather});

  @override
  State<WeatherFooter> createState() => _WeatherFooterState();
}

class _WeatherFooterState extends State<WeatherFooter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white30,
              )
          ),
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  'Humidity',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Text(
                  '${widget.currentWeather.humidity}%',
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Wind',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Text(
                  '${widget.currentWeather.windSpeed}',
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  'Pressure',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Text(
                  '${widget.currentWeather.pressure}',
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
