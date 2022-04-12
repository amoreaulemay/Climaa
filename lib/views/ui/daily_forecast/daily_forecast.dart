import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/models/quick_forecast.dart';
import 'package:climaa/views/ui/hourly_forecast/hourly_forecast_item.dart';
import 'package:flutter/material.dart';

import 'daily_forecast_item.dart';

class DailyForecast extends StatelessWidget {
  final AppColours theme;
  final List<QuickForecastModel> forecasts;

  DailyForecast({Key? key, required this.theme, required this.forecasts}) : super(key: key) {
    if (forecasts.length != 3) {
      throw Exception('List has to have a length of 3');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DailyForecastItem(theme: theme, forecastModel: forecasts[0]),
            DailyForecastItem(theme: theme, forecastModel: forecasts[1]),
            DailyForecastItem(theme: theme, forecastModel: forecasts[2]),
          ],
        ),
      ),
    );
  }
}
