import 'package:flutter/material.dart';

/// The spacing between the main elements vertically.
const double kCurrentForecastSpacing = 5.0;

/// The margin to the left of screen of the entire assembly.
const EdgeInsets kCurrentForecastLeftMargin = EdgeInsets.only(left: 30.0);

/// The [TextStyle] applied to the city name.
const TextStyle kCurrentForecastCityStyle = TextStyle(
  fontWeight: FontWeight.w100,
  fontSize: 25.0,
  fontFamily: 'Avenir Next',
);

/// The [TextStyle] applied to the temperature indicator.
const TextStyle kCurrentForecastTempStyle = TextStyle(
  fontSize: 70.0,
  fontWeight: FontWeight.w300,
  fontFamily: 'Avenir Next',
  letterSpacing: -10.0,
);

/// The [TextStyle] applied to the degree marker.
const TextStyle kCurrentForecastDegreeStyle = TextStyle(
  fontSize: 60.0,
  fontWeight: FontWeight.w100,
  fontFamily: 'Avenir Next',
);

/// The top padding applied to the temperature indicator.
final EdgeInsets kCurrentForecastTempTopMargin = EdgeInsets.only(top: kCurrentForecastTempStyle.fontSize! - kCurrentForecastDegreeStyle.fontSize!);
