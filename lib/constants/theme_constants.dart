import 'package:climaa/models/helpers/json_shared_functions.dart';
import 'package:climaa/views/ui/tab_bar/tab_bar_icon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This class exists to provide the app with the colours needed to create the theme.
class AppColours {
  /// The primary gradient used throughout the app.
  LinearGradient get primaryGradient => LinearGradient(
        colors: [primaryGradientStart, primaryGradientEnd],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      );

  /// The gradient used for the sunrise time globe.
  RadialGradient get sunriseTimeGradient => RadialGradient(
        colors: [sunShineAccent, tabBarActive],
        center: const Alignment(-0.26, -0.19),
      ).scale(1.8);

  /// The gradient used for the moonrise time globe.
  RadialGradient get moonriseTimeGradient => RadialGradient(
        colors: [moonShineAccent, moonBaseColour],
        center: const Alignment(-0.26, -0.19),
      ).scale(1.8);

  /// The gradient used for the Sine Wave widget.
  LinearGradient get sineWaveGradient => LinearGradient(
        colors: [
          sunShineAccent,
          linkText,
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      );

  /// The glow that is applied around the sunrise icon.
  BoxShadow get sunriseGlow => BoxShadow(
        color: sunShineAccent.withOpacity(0.26),
        blurRadius: 20.0,
      );

  /// The glow that is applied around the moonrise icon.
  BoxShadow get moonriseGlow => BoxShadow(
        color: moonShineAccent.withOpacity(0.26),
        blurRadius: 20.0,
      );

  /// This is the box decoration to create the sunrise globe.
  BoxDecoration get sunriseDecoration => BoxDecoration(
        shape: BoxShape.circle,
        gradient: sunriseTimeGradient,
        boxShadow: [
          sunriseGlow,
        ],
      );

  /// This is the box decoration to create the moonrise globe.
  BoxDecoration get moonriseDecoration => BoxDecoration(
        shape: BoxShape.circle,
        gradient: moonriseTimeGradient,
        boxShadow: [
          moonriseGlow,
        ],
      );

  /// The box decoration for the sine wave widget.
  BoxDecoration get sineWaveDecoration => BoxDecoration(
        gradient: sineWaveGradient,
      );

  /// The text style used in the sunrise and moonrise widget.
  TextStyle get dayTimeWidgetTextStyle => TextStyle(
        color: primaryText,
        fontSize: 14.0,
      );

  /// The text style used for the display of the city name in the search results cards.
  TextStyle get searchResultsCityName => TextStyle(
        color: primaryText,
        fontSize: 18.0,
      );

  /// The text style used for the display of predictive part of the city name in the search results cards.
  TextStyle get searchResultsCityNamePredictive => TextStyle(
        color: secondaryText,
        fontSize: 18.0,
      );

  /// The text style used for displaying the city state and country in the search results.
  TextStyle get searchResultsCityDetails => TextStyle(
        color: secondaryText,
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
      );

  /// The generated theme data for the app.
  ThemeData get theme => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: cardBackground,
          centerTitle: true,
          foregroundColor: primaryText,
          titleTextStyle: TextStyle(
            color: primaryText,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: brightness,
          ),
        ),
        backgroundColor: background,
        bottomAppBarTheme: BottomAppBarTheme(
          color: background.withOpacity(0),
          elevation: 0,
        ),
        brightness: brightness,
        textTheme: Typography.whiteHelsinki,
      );

  /// The main background colour of the app.
  final Color background;

  /// The brightness of the theme.
  final Brightness brightness;

  /// The colour used as background for cards, and for the App Bar.
  final Color cardBackground;

  /// The accent colour used for `SI Icons`.
  final Color infoBarBlue;

  /// This color is used for links, or field buttons. It's also used as button foreground colour in the App Bar,
  /// and as a secondary text with more emphasis.
  final Color linkText;

  /// The base colour used in the moonrise time gradient.
  final Color moonBaseColour;

  /// The accent colour used in the moonrise time gradient.
  final Color moonShineAccent;

  /// The colour of the little spots on the moon.
  final Color moonSpotColour;

  /// The colour used as background for the weather condition pills.
  final Color pillBackground;

  /// The end colour for the primary gradient used in the theme.
  final Color primaryGradientEnd;

  /// The start colour for the primary gradient used in the theme.
  final Color primaryGradientStart;

  /// The colour of the primary text.
  final Color primaryText;

  /// The colour of secondary text.
  final Color secondaryText;

  /// The accent colour used in the sunrise time gradient.
  final Color sunShineAccent;

  /// The accent colour used for the tab bar. Also used in the gradient for the sunrise time as the base colour.
  final Color tabBarActive;

  /// The colour for inactive tab bar items.
  final Color tabBarInactive;

  /// The icon set for the home tab.
  final TabBarIconModel tabBarHome;

  /// The icon set for the search tab.
  final TabBarIconModel tabBarSearch;

  /// The icon set for the favourites tab.
  final TabBarIconModel tabBarFavourites;

  /// The icon set for the menu tab.
  final TabBarIconModel tabBarMenu;

  /// The chosen [ThemeName]
  final ThemeName chosen;

  AppColours(
    this.background,
    this.brightness,
    this.cardBackground,
    this.infoBarBlue,
    this.linkText,
    this.moonBaseColour,
    this.moonShineAccent,
    this.moonSpotColour,
    this.pillBackground,
    this.primaryGradientEnd,
    this.primaryGradientStart,
    this.primaryText,
    this.secondaryText,
    this.sunShineAccent,
    this.tabBarActive,
    this.tabBarInactive,
    this.tabBarHome,
    this.tabBarSearch,
    this.tabBarFavourites,
    this.tabBarMenu,
    this.chosen,
  );

  /// This class should always be instantiated from JSON.
  AppColours.fromJson(Map<String, dynamic> themeData, ThemeName themeName)
      : background = themeData.getColorFor('background'),
        brightness = themeData['brightness'] == 'dark' ? Brightness.dark : Brightness.light,
        cardBackground = themeData.getColorFor('cardBackground'),
        infoBarBlue = themeData.getColorFor('infoBarBlue'),
        linkText = themeData.getColorFor('linkText'),
        moonBaseColour = themeData.getColorFor('moonBaseColour'),
        moonShineAccent = themeData.getColorFor('moonShineAccent'),
        moonSpotColour = themeData.getColorFor('moonSpotColour'),
        pillBackground = themeData.getColorFor('pillBackground'),
        primaryGradientEnd = themeData.getColorFor('primaryGradientEnd'),
        primaryGradientStart = themeData.getColorFor('primaryGradientStart'),
        primaryText = themeData.getColorFor('primaryText'),
        secondaryText = themeData.getColorFor('secondaryText'),
        sunShineAccent = themeData.getColorFor('sunShineAccent'),
        tabBarActive = themeData.getColorFor('tabBarActive'),
        tabBarInactive = themeData.getColorFor('tabBarInactive'),
        tabBarHome = themeData.getIcons(forTab: Tabs.home),
        tabBarSearch = themeData.getIcons(forTab: Tabs.search),
        tabBarFavourites = themeData.getIcons(forTab: Tabs.favourites),
        tabBarMenu = themeData.getIcons(forTab: Tabs.menu),
        chosen = themeName;
}

/// Convenience function to decode a list of 4 ints to color from ARGB.
Color colourFromList(List<int> fromList) {
  List<int> l = fromList;

  if (l.length != 4) {
    throw Exception('Invalid list length.');
  }

  for (final e in l) {
    if (255 < e || e < 0) {
      throw Exception('Invalid value in list!');
    }
  }

  return Color.fromARGB(l[0], l[1], l[2], l[3]);
}

/// Instantiate `AppColours` with the provided named theme.
Future<AppColours> getColours(ThemeName theme) async {
  Map<String, dynamic> themeData = await JSON.decodeFrom(url: theme.url);
  return AppColours.fromJson(themeData['theme_data'], theme);
}

extension ThemeDataExt on Map<String, dynamic> {
  /// Convenience extension to provide code clarity in the `AppColours.fromJson()` constructor.
  Color getColorFor(String index) {
    return colourFromList(this[index].cast<int>());
  }

  TabBarIconModel getIcons({required Tabs forTab}) {
    return TabBarIconModel(
      active: this['tabBarIcons'][forTab.toString().split('.').last]['active'],
      inactive: this['tabBarIcons'][forTab.toString().split('.').last]['inactive'],
    );
  }
}

/// Provides the base path for all themes.
const String kThemeBaseUrl = 'data/themes/';

/// Convenience enum to store all themes in a programmatically way.
enum ThemeName { neondark }

/// Extension to return the theme's path.
extension ThemeUrl on ThemeName {
  String get url => kThemeBaseUrl + toString().split('.').last + '.json';
  String get name => toString().split('.').last;
}

// GENERAL CONSTANTS
const double kBottomBarHeight = 72.0;
const double kSineWaveThickness = 2.0;
const double kSunriseSunsetWidgetHeight = 50.0;
const double kMarkerRadius = 5.0;

// CLIMAA LIST CONSTANTS
const EdgeInsets kClimaaListPadding = EdgeInsets.symmetric(horizontal: 30.0);
const EdgeInsets kClimaaListItemPadding = EdgeInsets.symmetric(horizontal: 10.0);

// CLIMAA CARD CONSTANTS
const EdgeInsets kClimaaCardPadding = EdgeInsets.symmetric(horizontal: 30.0, vertical: 7.5);

// CLIMAA SEARCH RESULTS CONSTANTS
const double kSearchResultsCardHeight = 80.0;
