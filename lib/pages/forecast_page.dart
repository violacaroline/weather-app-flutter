import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/models/forecasted_weather.dart';
import 'package:weather_app/widgets/app_bar.dart';
import 'package:weather_app/widgets/weather_forecast.dart';
import '../services/api_request_handler.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  final ApiRequestHandler requestHandler = ApiRequestHandler();
  List<ForecastedWeather>? forecastedWeatherList;

  @override
  initState() {
    super.initState();
    getForecastedWeather();
  }

  Future<void> getForecastedWeather() async {
    try {
      List decodedData = await requestHandler.fetchForecastedWeather();

      setState(() {
        forecastedWeatherList = decodedData.map((data) {
          // Parse the 'dt_txt' string into a DateTime object
          DateTime dtTxt = DateTime.parse(data['dt_txt']);

          // Extract date and time components
          String date = '${dtTxt.year}-${dtTxt.month.toString().padLeft(2, '0')}-${dtTxt.day.toString().padLeft(2, '0')}';
          String time = '${dtTxt.hour.toString().padLeft(2, '0')}:${dtTxt.minute.toString().padLeft(2, '0')}';

          // Assuming the 'icon' field is inside the 'weather' list
          String iconCode = data['weather'][0]['icon'];
          String iconUrl = 'https://openweathermap.org/img/wn/$iconCode@2x.png';

          return ForecastedWeather(
            date: date,
            time: time,
            description: data['weather'][0]['description'],
            temperature: data['main']['temp'].round(),
            iconUrl: iconUrl,
          );
        }).toList();
      });
    } catch (error) {
      GoRouter.of(context).go('/error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: WeatherForecast(forecastedWeather: forecastedWeatherList),
          ),
        ],
      ),
    );
  }
}