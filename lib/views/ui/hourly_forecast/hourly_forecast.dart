import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/models/quick_forecast.dart';
import 'package:climaa/views/ui/hourly_forecast/hourly_forecast_item.dart';
import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  final AppColours theme;
  final List<QuickForecastModel> forecasts;

  const HourlyForecast({Key? key, required this.theme, required this.forecasts}) : super(key: key);

  List<Widget> get body {
    List<Widget> bodyList = [
      const SizedBox(
        width: 25.0,
      ),
    ];

    /// Sorting the forecasts by time.
    forecasts.sort((a, b) => a.time.compareTo(b.time));

    for (final QuickForecastModel forecast in forecasts) {
      bodyList.add(
        HourlyForecastItem(
          theme: theme,
          forecast: forecast,
        ),
      );
    }

    return bodyList;
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/1.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/2.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/3.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/4.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/9.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/10.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/11.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/13.png'), context);
    precacheImage(AssetImage('assets/images/sw/${theme.chosen.name}/50.png'), context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 10.0,
            left: 40.0,
          ),
          child: Text(
            'Today',
            style: TextStyle(
              color: theme.secondaryText,
              fontSize: 20.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 20.0,
          ),
          child: SizedBox(
            height: 75.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: body,
            ),
          ),
        ),
      ],
    );
  }
}
