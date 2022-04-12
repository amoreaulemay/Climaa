import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/models/weather_conditions.dart';
import 'package:flutter/material.dart';

import 'current_forecast_display/current_forecast_display.dart';
import 'lw_display/lw_display.dart';

class LargeWeather extends StatelessWidget {
  final AppColours theme;
  final WeatherCondition condition;
  final int temperature;
  final String city;

  const LargeWeather({
    Key? key,
    required this.theme,
    required this.condition,
    required this.temperature,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/lw/neondark/${condition.condition?.iconID}.png'), context);

    return SizedBox(
      height: 250.0,
      child: Stack(
        children: [
          CurrentForecastDisplay(
            condition: condition.condition?.main ?? '',
            theme: theme,
            temperature: temperature,
            city: city,
          ),
          LWDisplay(
            assetUrl: 'assets/images/lw/neondark/${condition.condition?.iconID}.png',
          ),
        ],
      ),
    );
  }
}
