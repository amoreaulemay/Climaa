import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/models/quick_forecast.dart';
import 'package:climaa/views/ui/climaa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyForecastItem extends StatelessWidget {
  final AppColours theme;
  final QuickForecastModel forecastModel;

  const DailyForecastItem({Key? key, required this.theme, required this.forecastModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('EEEE');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            formatter.format(forecastModel.time),
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
        Expanded(
          child: SWIcon(
            theme: theme,
            iconID: forecastModel.condition.iconID,
            size: const Size(
              25.0,
              25.0,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Text(
                '${forecastModel.maxTemp}º',
              ),
              const SizedBox(
                width: 20.0,
              ),
              Text(
                '${forecastModel.minTemp}º',
                style: TextStyle(
                  color: theme.linkText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
