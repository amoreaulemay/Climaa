import 'dart:math';

import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Path> {
  final double lineThickness;

  const WaveClipper({required this.lineThickness});

  @override
  Path getClip(Size size) {
    // TODO: Document!
    Path curve = Path();
    SineWavePoints swp = SineWavePoints(height: size.height, width: size.width, lineThickness: lineThickness);

    curve.lineTo(swp.p0.dx, swp.p0.dy);

    curve.quadraticBezierTo(swp.p1.dx, swp.p1.dy, swp.p2.dx, swp.p2.dy);

    curve.quadraticBezierTo(swp.p3.dx, swp.p3.dy, swp.p4.dx, swp.p4.dy);

    curve.lineTo(size.width, size.height);

    curve.quadraticBezierTo(swp.p5.dx, swp.p5.dy, swp.p6.dx, swp.p6.dy);

    curve.quadraticBezierTo(swp.p7.dx, swp.p7.dy, swp.p8.dx, swp.p8.dy);

    return curve;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}

class SineWavePoints {
  final double height;
  final double width;
  final double lineThickness;

  const SineWavePoints({required this.height, required this.width, required this.lineThickness});

  /// Represents the starting point of the sine wave; the top-left corner.
  final Offset p0 = const Offset(0, 0);

  /// This point is situated at 1/4 the widget's width. From top `(x, y) = (25%, 0)`. This belongs to the top clipping part.
  Offset get p1 => Offset(width / 4, 0);

  /// This point is situated at 1/2 the widget's width. From top `(x, y) = (50%, ~50%)`. The line thickness is subtracted
  /// as a correction factor. This belongs to the top clipping part.
  Offset get p2 => Offset(width / 2, (height - lineThickness) / 2);

  /// This point is situated at 3/4 the widget's width. From top `(x, y) = (75%, ~100%)`. The line thickness is subtracted
  /// as a correction factor. This belongs to the top clipping part.
  Offset get p3 => Offset(width * 3 / 4, height - lineThickness);

  /// This point is situated at 100% the widget's width. From top `(x, y) = (100%, ~100%)`. The line thickness is subtracted
  /// as a correction factor. This belongs to the top clipping part.
  Offset get p4 => Offset(width, height - lineThickness);
  Offset get p5 => Offset(width * 3 / 4, height);
  Offset get p6 => Offset(width / 2, (height + lineThickness) / 2);
  Offset get p7 => Offset(width / 4, lineThickness);
  Offset get p8 => Offset(0, lineThickness);

  /// This function maps the `topOffset` to apply to a marker given its `leftOffset` and `circleRadius`. It uses the
  /// De Casteljau's algorithm for a three points bezier curve.
  double mapHeight({required double leftOffset, required double circleRadius}) {
    /// The curve is divided in two sections, repeated twice at different heights to create the line thickness.
    /// But for the purposes of this function, it can be considered a single line, therefore only knowing which
    /// half of the total curves matters. By dividing `leftOffset` by the total width, you get its position in percentage
    /// relative to the left of the widget.
    double percentage = leftOffset / width;

    /// Since the three control points are dependant on which half of the curve the marker is located in, these
    /// variables are late initialized.
    late double y1;
    late double y2;
    late double y3;

    /// The variable `t` represents the percentage the point is from the left of the section. Since this curve is
    /// divided in two section it is reconverted in a relative percentage.
    late double t;

    if (percentage <= 0.5) {
      /// Represents the first half of the curve.
      y1 = p0.dy;
      y2 = p1.dy;
      y3 = p2.dy;

      t = percentage * 2;
    } else {
      /// Represents the second half of the curve.
      y1 = p2.dy;
      y2 = p3.dy;
      y3 = p4.dy;

      t = (percentage - 0.5) * 2;
    }

    /// The formula to find the y value is based on De Casteljau's algorithm of building a 3-points bezier curve.
    /// `P = (1 - t)^2 * P1 + 2(t - 1)t * P2 + t^2 * P3`. The `circleRadius` is subtracted and the line thickness
    /// is added to accurately position the marker on the line.
    double height = pow(1 - t, 2).toDouble() * y1 + 2 * (1 - t) * t * y2 + pow(t, 2).toDouble() * y3 - circleRadius + lineThickness;

    return height;
  }
}
