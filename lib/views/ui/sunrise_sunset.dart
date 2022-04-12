import 'dart:math';

import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:uuid/uuid.dart';

import 'climaa.dart';

class SunriseSunset extends StatefulWidget {
  final AppColours theme;
  final DateTime sunrise;
  final DateTime sunset;

  SunriseSunset({Key? key, required this.theme, DateTime? sunriseTime, DateTime? sunsetTime})
      : sunrise = sunriseTime ?? DateTime.parse('2021-11-23 08:11:00Z'),
        sunset = sunsetTime ?? DateTime.parse('2021-11-23 16:34:00Z'),
        super(key: key);

  @override
  State<SunriseSunset> createState() => _SunriseSunsetState();
}

class _SunriseSunsetState extends State<SunriseSunset> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return SizedBox(
      height: kSunriseSunsetWidgetHeight * 3,
      width: double.infinity,
      child: Stack(
        children: [
          PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: [
              SunriseSunsetWave(
                theme: widget.theme,
                sunsetTime: widget.sunrise,
                sunriseTime: widget.sunset,
              ),
              SunriseSunsetInfos(
                theme: widget.theme,
                sunrise: widget.sunrise,
                sunset: widget.sunset,
              ),
            ],
            onPageChanged: (newIndex) {
              setState(() => currentIndex = newIndex);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PageMarker(
              nbOfPages: 2,
              currentIndex: currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}

class SunriseSunsetWave extends StatelessWidget {
  final AppColours theme;
  final DateTime sunrise;
  final DateTime sunset;

  SunriseSunsetWave({Key? key, required this.theme, DateTime? sunriseTime, DateTime? sunsetTime})
      : sunrise = sunriseTime ?? DateTime.parse('2021-11-23 08:11:00Z'),
        sunset = sunsetTime ?? DateTime.parse('2021-11-23 16:34:00Z'),
        super(key: key);

  // TODO: Auto-update??
  /// This function returns the `Offset` needed to position a marker on the sine wave from the top left corner of the widget.
  /// A custom `DateTime` can be provided in order to position a marker to an arbitrary value. If no `DateTime` is provided
  /// the widget will revert to actual time.
  Offset getMarkerOffset({required double widgetWidth, required double radius, DateTime? customTime}) {
    SineWavePoints swp = SineWavePoints(
      height: kSunriseSunsetWidgetHeight,
      width: widgetWidth,
      lineThickness: kSineWaveThickness,
    );

    /// The `currTime` can be set to a custom value, for example to position the sun and the moon globes at precise points.
    DateTime currTime = customTime ?? DateTime.now();

    /// The precision is in minutes. There would be no point of making it more precise than that.
    double offsetPerMinute = widgetWidth / 1440;

    /// Calculating the total minutes elapsed in the day since 00:00.
    double totalMinutesElapsed = currTime.hour * 60 + currTime.minute.toDouble();

    /// Making sure the marker doesn't overflow.
    double leftOffset = max(min(totalMinutesElapsed * offsetPerMinute - radius, widgetWidth - radius * 2), 0);

    /// The total widget is 3 times the sine wave height, so adding 1/3 to position the marker on the line.
    double topOffset = swp.mapHeight(leftOffset: leftOffset, circleRadius: radius) + kSunriseSunsetWidgetHeight;

    return Offset(leftOffset, topOffset);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSunriseSunsetWidgetHeight * 3,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Center(
            child: UI.sineWave(
              theme: theme,
              thickness: kSineWaveThickness,
              height: kSunriseSunsetWidgetHeight,
            ),
          ),
          // TODO: Change the UI file to a library.
          UI.offsetter(
            child: UI.globe(decoration: theme.sunriseDecoration, size: 15),
            offset: getMarkerOffset(widgetWidth: MediaQuery.of(context).size.width, radius: 7.5, customTime: sunrise),
          ),
          UI.offsetter(
            child: UI.globe(decoration: theme.moonriseDecoration, size: 15),
            offset: getMarkerOffset(
              widgetWidth: MediaQuery.of(context).size.width,
              radius: 7.5,
              customTime: sunset,
            ),
          ),
          TimerBuilder.periodic(
            const Duration(minutes: 1),
            builder: (BuildContext context) {
              return BlueMarker(
                theme: theme,
                offset: getMarkerOffset(
                  widgetWidth: MediaQuery.of(context).size.width,
                  radius: kMarkerRadius,
                ),
                radius: kMarkerRadius,
              );
            },
          ),
        ],
      ),
    );
  }
}

class SunriseSunsetInfos extends StatelessWidget {
  final AppColours theme;
  final DateTime sunrise;
  final DateTime sunset;

  const SunriseSunsetInfos({
    Key? key,
    required this.theme,
    required this.sunrise,
    required this.sunset,
  }) : super(key: key);

  /// This function parses a [DateTime] into a readable string for display to the user.
  String timeParse(DateTime object) => object.hour.toString() + ':' + object.minute.toString();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kSunriseSunsetWidgetHeight * 3,
      width: double.infinity,
      child: Center(
        child: ClimaaList(
          theme: theme,
          children: [
            ClimaaListTextItem(
              child: const Text('Sunrise'),
              rightHand: Text(
                timeParse(sunrise),
              ),
              uuid: const Uuid().v4(),
            ),
            ClimaaListTextItem(
              child: const Text('Sunset'),
              rightHand: Text(
                timeParse(sunset),
              ),
              uuid: const Uuid().v4(),
            ),
          ],
        ),
      ),
    );
  }
}

class PageMarker extends StatelessWidget {
  final int nbOfPages;
  final int currentIndex;

  const PageMarker({
    Key? key,
    required this.nbOfPages,
    required this.currentIndex,
  }) : super(key: key);

  List<Widget> getBody() {
    List<Widget> body = [];

    for (int i = 0; i < nbOfPages; i++) {
      i == currentIndex ? body.add(const PageMarkerDot(isActive: true)) : body.add(const PageMarkerDot(isActive: false));
    }

    return body;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: getBody(),
    );
  }
}

class PageMarkerDot extends StatelessWidget {
  final bool isActive;

  const PageMarkerDot({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 7.0,
      height: 7.0,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color.fromARGB(255, 80, 80, 80),
        shape: BoxShape.circle,
      ),
    );
  }
}
