import 'package:climaa/constants/theme_constants.dart';
import 'package:flutter/foundation.dart';

/// This is an interface to make sure all classes that need to access [AppColours] have
/// the needed variable.
@immutable
class ThemeProtocol {
  final AppColours theme;

  const ThemeProtocol(this.theme);
}
