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
    // Get the current time of day
    TimeOfDay currentTime = TimeOfDay.now();

    // Create TimeOfDay instances for 08:00 and 20:00
    TimeOfDay startTime = const TimeOfDay(hour: 8, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 20, minute: 0);

    // Convert TimeOfDay objects to int values for comparison
    int currentTimeInMinutes = currentTime.hour * 60 + currentTime.minute;
    int startTimeInMinutes = startTime.hour * 60 + startTime.minute;
    int endTimeInMinutes = endTime.hour * 60 + endTime.minute;

    // Check if the current time is between 08:00 and 20:00
    bool isDaytime = currentTimeInMinutes >= startTimeInMinutes && currentTimeInMinutes <= endTimeInMinutes;

    // Determine which icon to display based on the time of day
    IconData iconData = isDaytime ? Icons.wb_sunny_outlined : Icons.nightlight;
    String dayOrNight = isDaytime ? 'Day' : 'Night';

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
               Row(
                children: [
                  Icon(
                    iconData,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10,),
                  Text(
                    dayOrNight,
                    style: const TextStyle(
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
