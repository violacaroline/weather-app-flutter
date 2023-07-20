import 'package:flutter/material.dart';
import 'package:weather_app/widgets/weather_body.dart';
import '../models/weather.dart';
import '/widgets/weather_app_bar.dart';
import '/widgets/weather_footer.dart';
import 'package:weather_app/services/api_request_handler.dart';
import 'loading_page.dart';

class WeatherPage extends StatefulWidget {
  final String title;

  const WeatherPage({super.key, required this.title});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final ApiRequestHandler requestHandler = ApiRequestHandler();
  Weather? currentWeather;
  String? backGroundImg;

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  void getBackGroundImg(String weatherMain) {
    switch (weatherMain) {
      case 'Clear':
        setState(() {
          backGroundImg = 'assets/sunny.jpg';
        });
      case 'Clouds':
        setState(() {
          backGroundImg = 'assets/partly-cloudy.jpg';
        });
      case 'Rain':
        setState(() {
          backGroundImg = 'assets/rainy.jpg';
        });
      case 'Snow':
        setState(() {
          backGroundImg = 'assets/snowy.jpg';
        });
      case 'Thunderstorm':
        setState(() {
          backGroundImg = 'assets/thunder-storm.jpg';
        });
      default:
        setState(() {
          backGroundImg = 'assets/overcast.jpg';
        });
    }
  }

  Future<void> getCurrentWeather() async {
    // Map data = await requestHandler.fetchCurrentWeather();
    Map<String, dynamic> decodedData = await requestHandler.fetchCurrentWeather();
    String? location;
    String? weatherDescription;
    String? weatherMain;
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

      location = decodedData['name'];

      weatherDescription = weatherData['description'];
      weatherMain = weatherData['main'];

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
      print('City Name: $location');
    }

    setState(() {
      currentWeather = Weather(
        location: location!,
        description: weatherDescription!,
        mainDescription: weatherMain!,
        temperature: temperature!.round(),
        humidity: humidity!,
        windSpeed: windSpeed!,
        pressure: pressure!,
      );

      getBackGroundImg(weatherMain);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentWeather == null) {
      return const LoadingPage();
    } else {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const WeatherAppBar(),
        body: Stack(
          children: [
            Image.asset(
              backGroundImg!,
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