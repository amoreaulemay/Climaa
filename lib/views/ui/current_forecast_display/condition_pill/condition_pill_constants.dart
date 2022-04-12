import 'package:flutter/material.dart';

/// The height of the pill.
const double kPillHeight = 35.0;

/// The padding applied to the inner of the pill.
const EdgeInsets kPillPadding = EdgeInsets.symmetric(
  horizontal: 10.0,
  vertical: 5.0,
);

/// The [BorderRadius] applied to the pill.
const BorderRadius kPillBorderRadius = BorderRadius.all(
  Radius.circular(9999),
);

/// The [TextStyle] applied to the text inside the pill.
const TextStyle kPillTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
);
