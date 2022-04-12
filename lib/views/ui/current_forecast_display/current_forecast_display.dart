import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/views/ui/current_forecast_display/condition_pill/condition_pill.dart';
import 'package:flutter/material.dart';
import 'current_forecast_constants.dart';

class CurrentForecastDisplay extends StatelessWidget {
  final String city;
  final int temperature;
  final String condition;
  final AppColours theme;

  const CurrentForecastDisplay({
    Key? key,
    required this.city,
    required this.temperature,
    required this.condition,
    required this.theme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: MediaQuery.of(context).size.width / 2 - 5,
      child: SafeArea(
        child: Padding(
          padding: kCurrentForecastLeftMargin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city,
                style: kCurrentForecastCityStyle,
              ),
              const SizedBox(
                height: kCurrentForecastSpacing,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: kCurrentForecastTempTopMargin,
                    child: Text(
                      temperature.toString(),
                      style: kCurrentForecastTempStyle,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    'º',
                    style: kCurrentForecastDegreeStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: kCurrentForecastSpacing,
              ),
              ConditionPill(
                theme: theme,
                condition: condition,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
