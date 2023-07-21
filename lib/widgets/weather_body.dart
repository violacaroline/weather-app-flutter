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
    TimeOfDay startTime = const TimeOfDay(hour: 7, minute: 0);
    TimeOfDay endTime = const TimeOfDay(hour: 20, minute: 0);

    // Convert TimeOfDay objects to int values for comparison
    int currentTimeInMinutes = currentTime.hour * 60 + currentTime.minute;
    int startTimeInMinutes = startTime.hour * 60 + startTime.minute;
    int endTimeInMinutes = endTime.hour * 60 + endTime.minute;

    // Check if the current time is between 08:00 and 20:00
    bool isDaytime = currentTimeInMinutes >= startTimeInMinutes && currentTimeInMinutes <= endTimeInMinutes;

    // Determine which icon to display based on the time of day
    IconData iconDataIsDaytime = isDaytime ? Icons.wb_sunny_outlined : Icons.nightlight;
    String dayOrNight = isDaytime ? 'Day' : 'Night';

    IconData iconDataWeatherType;
    switch (widget.currentWeather.mainDescription) {
      case 'Clear':
        iconDataWeatherType = Icons.sunny;
      case 'Clouds':
        iconDataWeatherType = Icons.cloud_outlined;
      case 'Rain':
        iconDataWeatherType = Icons.water_drop_outlined;
      case 'Snow':
        iconDataWeatherType = Icons.ac_unit;
      case 'Thunderstorm':
        iconDataWeatherType = Icons.thunderstorm_outlined;
      default:
        iconDataWeatherType = Icons.error_outline;
    }


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
              Row(
                children: [
                  Text(
                    '${DateTime.now().hour}:${DateTime.now().minute} | '
                        '${widget.currentWeather.description}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Icon(
                    iconDataWeatherType, // Use the iconData variable here
                    color: Colors.white, // Set the color for the icon
                  ),
                ],
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
                    iconDataIsDaytime,
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
