import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/.env' as env;
import 'dart:convert';

class ApiRequestHandler {
  //Get current location
  Future<Position> getCurrentLocation() async {
    PermissionStatus permissionStatus = await Permission.location.request();
    Position? position;

    // Get the current position (latitude and longitude)
    if (permissionStatus.isGranted) {
       position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high
      );
    }

    return position!;
  }

  // Get the current weather in the current location
  fetchCurrentWeather() async {
    try {
      Position position = await getCurrentLocation();

      var url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
        'lat': '${position.latitude}',
        'lon': '${position.longitude}',
        'appid': env.open_weather_api_key,
        'units': 'metric',
      });

      var response = await http.get(url);

      Map decodedData = jsonDecode(response.body);

      return decodedData;

    } catch (error) {
      print('Error: $error');
    }
  }

  // Get the forecast of the current location
  fetchForecastedWeather() {

  }
}