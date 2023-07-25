class ForecastedWeather {
  final String date;
  final String time;
  final String description;
  final int temperature;
  final String iconUrl;


  ForecastedWeather ({
    required this.date,
    required this.time,
    required this.description,
    required this.temperature,
    required this.iconUrl
  });

  @override
  String toString() {
    return 'Date: $date, Time: $time, Description: $description, Temperature: $temperature, Icon URL: $iconUrl';
  }
}
