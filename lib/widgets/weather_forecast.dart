import 'package:flutter/material.dart';
import 'package:weather_app/models/forecasted_weather.dart';
import 'package:weather_app/models/weather.dart';

class WeatherForecast extends StatefulWidget {
  List<ForecastedWeather>? forecastedWeather = [];

  WeatherForecast({super.key, required this.forecastedWeather});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  final List<Widget> _weatherForecastTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final Tween<Offset> _offset = Tween(
      begin: const Offset(1, 0), end: const Offset(0, 0));

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getWeatherForecast();
    });
  }

  Widget _createTile(ForecastedWeather forecastedWeather) {
    return ListTile(
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              const Icon(
                  Icons.sunny
              ),
              const SizedBox(width: 20,),
              Row(
                children: [
                  Column(
                    children: [
                      Text(forecastedWeather.description,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      Text('${forecastedWeather.temperature}',
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(forecastedWeather.date,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                      Text(forecastedWeather.time,
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _getWeatherForecast() {
    Future future = Future(() {});
    if (widget.forecastedWeather != null) {
      for (var forecastedWeather in widget.forecastedWeather!) {
        future = future.then((_) {
          return Future.delayed(const Duration(milliseconds: 200), () {
            _weatherForecastTiles.add(_createTile(forecastedWeather));
            _listKey.currentState?.insertItem(_weatherForecastTiles.length - 1);
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: _listKey,
        initialItemCount: _weatherForecastTiles.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(_offset),
            child: _weatherForecastTiles[index],
          );
        }
    );
  }
}

