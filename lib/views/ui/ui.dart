import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/views/ui/helpers/globe.dart';
import 'package:climaa/views/ui/helpers/offsetter.dart';
import 'package:climaa/views/ui/helpers/sinewave.dart';
import 'package:climaa/views/ui/sunrise_sunset.dart';
import 'package:flutter/material.dart';

// TODO: Change the UI file to a library.
// TODO: Document
class UI {
  static Widget globe({required BoxDecoration decoration, required double size}) => Globe(
        decoration: decoration,
        size: size,
      );

  static Widget sineWave({required AppColours theme, required double thickness, required double height}) => SineWave(
        theme: theme,
        thickness: thickness,
        height: height,
      );

  static Widget sunriseSunset({required AppColours theme}) => SunriseSunset(
        theme: theme,
      );

  static Widget offsetter({Offset? offset, Widget? child}) => Offsetter(
        child: child,
        offset: offset,
      );
}
