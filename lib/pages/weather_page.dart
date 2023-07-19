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
  Weather? currentWeather;

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future<void> getCurrentWeather() async {
    // Map data = await requestHandler.fetchCurrentWeather();
    Map<String, dynamic> decodedData = await requestHandler.fetchCurrentWeather();
    String? cityName;
    String? weatherDescription;
    double? temperature;
    int? humidity;
    double? windSpeed;
    int? pressure;

    print('The data: $decodedData');
    print('The time: ${DateTime.now()}');

    if (decodedData != null) {
      List<dynamic> weatherList = decodedData['weather'];
      Map<String, dynamic> weatherData = weatherList.isNotEmpty
          ? weatherList[0]
          : {};

      cityName = decodedData['name'];

      weatherDescription = weatherData['description'];

      Map<String, dynamic> mainData = decodedData['main'];
      temperature = mainData['temp'];
      humidity = mainData['humidity'];
      pressure = mainData['pressure'];

      Map<String, dynamic> windData = decodedData['wind'];
      windSpeed = windData['speed'];

      print('Description: $weatherDescription');
      print('Temperature: $temperature');
      print('Humidity: $humidity');
      print('Pressure: $pressure');
      print('City Name: $cityName');
    }
    setState(() {
      currentWeather = Weather(
        location: cityName!,
        description: weatherDescription!,
        temperature: temperature!.round()!,
        humidity: humidity!,
        windSpeed: windSpeed!,
        pressure: pressure!,
      );
    });
    /*return Weather(location: cityName!, description: weatherDescription!, temperature: temperature!, humidity: humidity!,
        windSpeed: windSpeed!, pressure: pressure!);*/
  }

  @override
  Widget build(BuildContext context) {
    if (currentWeather == null) {
      // Display a loading indicator or placeholder widget
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.grey,
            strokeWidth: 7,
          ),
        ),
      );
    } else {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const WeatherAppBar(),
        body: Stack(
          children: [
            Image.asset(
              'assets/sunny.jpg',
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WeatherBody(currentWeather: currentWeather!),
                  WeatherFooter(currentWeather: currentWeather!),
                ],
              ),
            )],
        ),
      );
    }
  }
}