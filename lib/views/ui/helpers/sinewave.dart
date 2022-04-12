import 'package:climaa/constants/theme_constants.dart';
import 'package:climaa/views/ui/helpers/waveclipper.dart';
import 'package:flutter/material.dart';

class SineWave extends StatelessWidget {
  final AppColours theme;
  final double thickness;
  final double height;

  const SineWave({Key? key, required this.theme, required this.thickness, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(lineThickness: thickness),
      child: Container(
        decoration: theme.sineWaveDecoration,
        height: height,
      ),
    );
  }
}
