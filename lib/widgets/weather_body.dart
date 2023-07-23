import 'package:flutter/material.dart';

import '../models/weather.dart';

class WeatherBody extends StatelessWidget {
  final Weather currentWeather;

  const WeatherBody({super.key, required this.currentWeather});

  bool determineIsDaytime(TimeOfDay currentTime) {
    const TimeOfDay startTime = TimeOfDay(hour: 7, minute: 0);
    const TimeOfDay endTime = TimeOfDay(hour: 20, minute: 0);
    final int currentTimeInMinutes = currentTime.hour * 60 + currentTime.minute;
    final int startTimeInMinutes = startTime.hour * 60 + startTime.minute;
    final int endTimeInMinutes = endTime.hour * 60 + endTime.minute;

    return currentTimeInMinutes >= startTimeInMinutes && currentTimeInMinutes <= endTimeInMinutes;
  }

  IconData getWeatherIcon() {
    switch (currentWeather.mainDescription) {
      case 'Clear':
        return Icons.sunny;
      case 'Clouds':
        return Icons.cloud_outlined;
      case 'Rain':
        return Icons.water_drop_outlined;
      case 'Snow':
        return Icons.ac_unit;
      case 'Thunderstorm':
        return Icons.thunderstorm_outlined;
      default:
        return Icons.error_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    final TimeOfDay currentTime = TimeOfDay.now();
    final bool isDaytime = determineIsDaytime(currentTime);
    final IconData iconDataIsDaytime = isDaytime ? Icons.wb_sunny_outlined : Icons.nightlight;
    final String dayOrNight = isDaytime ? 'Day' : 'Night';
    final IconData iconDataWeatherType = getWeatherIcon();

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
                currentWeather.location,
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
                        '${currentWeather.description}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Icon(
                    iconDataWeatherType,
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${currentWeather.temperature}\u2103',
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
