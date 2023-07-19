import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_body.dart';
import '../models/weather.dart';
import '/widgets/weather_app_bar.dart';
import '/widgets/weather_footer.dart';
import 'package:weather_app/services/api_request_handler.dart';

class WeatherPage extends StatefulWidget {
  final String title;

  const WeatherPage({super.key, required this.title});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final ApiRequestHandler requestHandler = ApiRequestHandler();

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  void getCurrentWeather() async {
    // Map data = await requestHandler.fetchCurrentWeather();
    Map<String, dynamic> decodedData = await requestHandler.fetchCurrentWeather();

    print('The data: $decodedData');

    if (decodedData != null) {
      List<dynamic> weatherList = decodedData['weather'];
      Map<String, dynamic> weatherData = weatherList.isNotEmpty
          ? weatherList[0]
          : {};

      String description = weatherData['description'];

      Map<String, dynamic> mainData = decodedData['main'];
      double temperature = mainData['temp'];
      int humidity = mainData['humidity'];
      int pressure = mainData['pressure'];

      String cityName = decodedData['name'];

      print('Description: $description');
      print('Temperature: $temperature');
      print('Humidity: $humidity');
      print('Pressure: $pressure');
      print('City Name: $cityName');
    }
    //return Weather(description: data.weather[description], temperature: temperature, humidity: humidity, windSpeed: windSpeed)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const WeatherAppBar(),
      body: Stack(
        children: [
          Image.asset(
            'assets/snowy.jpg',
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
                WeatherBody(),
                WeatherFooter(),
              ],
            ),
          )],
      ),
    );
  }
}