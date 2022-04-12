import 'package:flutter/material.dart';

extension EdgeInsetsExtraProperties on EdgeInsets {
  double get vertical => top + bottom;
  double get horizontal => left + right;
}
