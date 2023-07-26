import 'package:flutter/material.dart';
import 'package:weather_app/models/forecasted_weather.dart';
import '../pages/loading_page.dart';

class WeatherForecast extends StatefulWidget {
  final List<ForecastedWeather>? forecastedWeather;

  const WeatherForecast({super.key, required this.forecastedWeather});

  @override
  State<WeatherForecast> createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  final List<Widget> _weatherForecastTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final Tween<Offset> _offset = Tween(
      begin: const Offset(1, 0),
      end: const Offset(0, 0)
  );

  @override
  void didUpdateWidget(WeatherForecast oldWidget) {
    super.didUpdateWidget(oldWidget);
    _createWeatherForecast();
  }

  Widget _createTile(ForecastedWeather forecastedWeather) {
    return ListTile(
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Image.network(forecastedWeather.iconUrl,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 25,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(forecastedWeather.description,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                        Text('${forecastedWeather.temperature}\u2103',
                          style: const TextStyle(
                              fontSize: 35, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(forecastedWeather.date,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                        Text(forecastedWeather.time,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _createWeatherForecast() {
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
    if (widget.forecastedWeather == null) {
      // Show the LoadingPage while waiting for data
      return const LoadingPage();
    } else {
      // Show the AnimatedList once the data is available
      return AnimatedList(
        key: _listKey,
        initialItemCount: _weatherForecastTiles.length,
        itemBuilder: (context, index, animation) {
          return SlideTransition(
            position: animation.drive(_offset),
            child: _weatherForecastTiles[index],
          );
        },
      );
    }
  }
}