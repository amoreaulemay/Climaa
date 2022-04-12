import 'dart:math';

import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/models/quick_forecast.dart';
import 'package:climaa/models/quick_infos_model.dart';
import 'package:climaa/models/weather_conditions.dart';
import 'package:climaa/views/ui/climaa.dart';
import 'package:flutter/material.dart';

List<QuickForecastModel> getSampleData(int amount, [double? minTemp, double? maxTemp, int timeMultiplier = 1]) {
  List<QuickForecastModel> data = [];

  for (int i = 0; i < amount; i++) {
    int rKey = WeatherCondition.lookupTable.keys.elementAt(Random().nextInt(WeatherCondition.lookupTable.length));
    double temperature = Random().nextInt(26).toDouble();
    DateTime time = DateTime.now().add(Duration(hours: i * timeMultiplier));

    data.add(
      QuickForecastModel(
        condition: WeatherCondition.lookupTable[rKey]!,
        temperature: temperature,
        time: time,
        minTemp: minTemp,
        maxTemp: maxTemp,
      ),
    );
  }

  return data;
}

class HomeView extends StatefulWidget {
  final AppColours theme;

  const HomeView({Key? key, required this.theme}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void didChangeDependencies() {
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/1.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/2.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/3.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/4.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/9.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/10.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/11.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/13.png'), context);
    precacheImage(AssetImage('assets/images/sw/${widget.theme.chosen.name}/50.png'), context);

    precacheImage(AssetImage('assets/images/tab_bar_icons/${widget.theme.chosen.name}/home_active.png'), context);
    precacheImage(AssetImage('assets/images/tab_bar_icons/${widget.theme.chosen.name}/home_inactive.png'), context);
    precacheImage(AssetImage('assets/images/tab_bar_icons/${widget.theme.chosen.name}/home_active.png'), context);
    precacheImage(AssetImage('assets/images/tab_bar_icons/${widget.theme.chosen.name}/search_active.png'), context);
    precacheImage(AssetImage('assets/images/tab_bar_icons/${widget.theme.chosen.name}/search_inactive.png'), context);
    precacheImage(AssetImage('assets/images/tab_bar_icons/${widget.theme.chosen.name}/favourites_active.png'), context);
    precacheImage(AssetImage('assets/images/tab_bar_icons/${widget.theme.chosen.name}/favourites_inactive.png'), context);
    precacheImage(AssetImage('assets/images/tab_bar_icons/${widget.theme.chosen.name}/menu_active.png'), context);
    precacheImage(AssetImage('assets/images/tab_bar_icons/${widget.theme.chosen.name}/menu_inactive.png'), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LargeWeather(
          theme: widget.theme,
          condition: const WeatherCondition(weatherID: 801),
          temperature: 17,
          city: 'San Francisco',
        ),
        QuickInfoBar(
          theme: widget.theme,
          quickInfosModel: const QuickInfosModel.si(
            humidity: 13,
            pressure: 101.325,
            windSpeed: 5,
          ),
        ),
        SunriseSunset(
          theme: widget.theme,
          sunriseTime: DateTime.fromMillisecondsSinceEpoch(1638170428 * 1000),
          sunsetTime: DateTime.fromMillisecondsSinceEpoch(1638201483 * 1000),
        ),
        HourlyForecast(
          theme: widget.theme,
          forecasts: getSampleData(24),
        ),
        DailyForecast(
          theme: widget.theme,
          forecasts: getSampleData(
            3,
            14,
            19,
            24,
          ),
        ),
      ],
    );
  }
}
