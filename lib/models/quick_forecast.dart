import 'package:climaa/models/weather_conditions.dart';

class QuickForecastModel {
  final WeatherDescriptor condition;
  final double temperature;
  final DateTime time;
  final double _minTemp;
  final double _maxTemp;

  const QuickForecastModel({required this.condition, required this.temperature, required this.time, double? minTemp, double? maxTemp})
      : _minTemp = minTemp ?? temperature,
        _maxTemp = maxTemp ?? temperature;

  const QuickForecastModel.daily({required this.condition, required this.time, required double minTemp, required double maxTemp})
      : _minTemp = minTemp,
        _maxTemp = maxTemp,
        temperature = 0;

  double get minTemp => _minTemp;
  double get maxTemp => _maxTemp;
}
