import 'package:flutter/material.dart';

import '../models/weather.dart';

class WeatherBody extends StatefulWidget {
  final Weather currentWeather;

  const WeatherBody({super.key, required this.currentWeather});

  @override
  State<WeatherBody> createState() => _WeatherBodyState();
}

class _WeatherBodyState extends State<WeatherBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80,),
              Text(
                widget.currentWeather.location,
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                    color: Colors.white
                ),
              ),
              Text(
                '${DateTime.now().hour}:${DateTime.now().minute} | '
                    '${widget.currentWeather.description}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.currentWeather.temperature}\u2103',
                style: const TextStyle(
                    fontSize: 85,
                    fontWeight: FontWeight.w200,
                    color: Colors.white
                ),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.wb_sunny_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10,),
                  Text(
                    'Day',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
