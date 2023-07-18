import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({super.key});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  List<Widget> _weatherForecastTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getWeatherForecast();
    });
  }

  void _getWeatherForecast() {
    List<Weather> weatherByDay = [
      Weather(description: 'sunny', temperature: 30, humidity: 75, windSpeed: 4),
      Weather(description: 'cloudy', temperature: 32, humidity: 80, windSpeed: 7),
      Weather(description: 'sunny', temperature: 28, humidity: 75, windSpeed: 4),
      Weather(description: 'rainy', temperature: 29, humidity: 80, windSpeed: 7)
    ];

    Future future = Future((){});
    weatherByDay.forEach((Weather weather) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 200), () {
        _weatherForecastTiles.add(_createTile(weather));
        _listKey.currentState?.insertItem(_weatherForecastTiles.length - 1);
        });
      });
    });
  }

  Widget _createTile(Weather weather) {
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
              Column(
                children: [
                  Text(weather.description,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  Text('${weather.temperature}',
                    style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  final Tween<Offset> _offset = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));

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
