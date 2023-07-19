import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/.env' as env;
import 'dart:convert';

class OpenWeatherApi {
  //Get current location
  Future<void> getCurrentLocation() async {

  }

  // Get the current weather in the current location
  fetchCurrentWeather() async {
    PermissionStatus permissionStatus = await Permission.location.request();
    double latitude = 0;
    double longitude = 0;

    // Get the current position (latitude and longitude)
    if (permissionStatus.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      );
      latitude = position.latitude;
      longitude = position.longitude;
    }

    print('Lat: $latitude');
    print('Long: $longitude');
    print('api key: ${env.open_weather_api_key}');


    var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'lat': '$latitude',
      'lon': '$longitude',
      'appid': env.open_weather_api_key,
      'units': 'metric',
    });

    var response = await http.get(url);

    /*print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');*/
    Map decodedData = jsonDecode(response.body);

    return decodedData;
  }

  // Get the forecast of the current location
  fetchForecastedWeather() {

  }
}