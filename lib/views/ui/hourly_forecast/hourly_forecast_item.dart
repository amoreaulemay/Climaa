import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/models/quick_forecast.dart';
import 'package:flutter/material.dart';
import 'package:climaa/views/ui/climaa.dart';
import 'package:intl/intl.dart';

class HourlyForecastItem extends StatelessWidget {
  final AppColours theme;
  final QuickForecastModel forecast;

  const HourlyForecastItem({Key? key, required this.theme, required this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('H');
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/1.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/2.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/3.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/4.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/9.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/10.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/11.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/13.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/50.png'), context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${formatter.format(forecast.time)}:00'),
          SWIcon(
            theme: theme,
            iconID: forecast.condition.iconID,
            size: const Size(25, 25),
          ),
          Text('${forecast.temperature.toStringAsFixed(0)}º'),
        ],
      ),
    );
  }
}
