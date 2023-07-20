class Weather {
  final String location;
  final String description;
  final String mainDescription;
  final int temperature;
  final int humidity;
  final double windSpeed;
  final int pressure;

  Weather ({required this.location, required this.description, required this.mainDescription, required this.temperature,
    required this.humidity, required this.windSpeed, required this.pressure});
}
