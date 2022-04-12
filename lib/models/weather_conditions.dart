import 'package:climaa/extensions/extensions.dart';

class WeatherCondition {
  final int weatherID;

  const WeatherCondition({required this.weatherID});

  WeatherDescriptor? get condition => WeatherCondition.lookupTable[weatherID];

  static const Map<int, WeatherDescriptor> lookupTable = {
    200: WeatherDescriptor(main: WeatherMain.thunderstorm, description: 'thunderstorm with light rain', iconID: 11),
    201: WeatherDescriptor(main: WeatherMain.thunderstorm, description: 'thunderstorm with rain', iconID: 11),
    202: WeatherDescriptor(main: WeatherMain.thunderstorm, description: 'thunderstorm with heavy rain', iconID: 11),
    210: WeatherDescriptor(main: WeatherMain.thunderstorm, description: 'light thunderstorm', iconID: 11),
    211: WeatherDescriptor(main: WeatherMain.thunderstorm, description: 'thunderstorm', iconID: 11),
    212: WeatherDescriptor(main: WeatherMain.thunderstorm, description: 'heavy thunderstorm', iconID: 11),
    221: WeatherDescriptor(main: WeatherMain.thunderstorm, description: 'ragged thunderstorm', iconID: 11),
    230: WeatherDescriptor(main: WeatherMain.thunderstorm, description: 'thunderstorm with light drizzle', iconID: 11),
    231: WeatherDescriptor(main: WeatherMain.thunderstorm, description: 'thunderstorm with drizzle', iconID: 11),
    232: WeatherDescriptor(main: WeatherMain.thunderstorm, description: 'thunderstorm with heavy drizzle', iconID: 11),
    300: WeatherDescriptor(main: WeatherMain.drizzle, description: 'light intensity drizzle', iconID: 9),
    301: WeatherDescriptor(main: WeatherMain.drizzle, description: 'drizzle', iconID: 9),
    302: WeatherDescriptor(main: WeatherMain.drizzle, description: 'heavy intensity drizzle', iconID: 9),
    310: WeatherDescriptor(main: WeatherMain.drizzle, description: 'light intensity drizzle rain', iconID: 9),
    311: WeatherDescriptor(main: WeatherMain.drizzle, description: 'drizzle rain', iconID: 9),
    312: WeatherDescriptor(main: WeatherMain.drizzle, description: 'heavy intensity drizzle rain', iconID: 9),
    313: WeatherDescriptor(main: WeatherMain.drizzle, description: 'shower rain and drizzle', iconID: 9),
    314: WeatherDescriptor(main: WeatherMain.drizzle, description: 'heavy shower rain and drizzle', iconID: 9),
    321: WeatherDescriptor(main: WeatherMain.drizzle, description: 'shower drizzle', iconID: 9),
    500: WeatherDescriptor(main: WeatherMain.rain, description: 'light rain', iconID: 10),
    501: WeatherDescriptor(main: WeatherMain.rain, description: 'moderate rain', iconID: 10),
    502: WeatherDescriptor(main: WeatherMain.rain, description: 'heavy intensity rain', iconID: 10),
    503: WeatherDescriptor(main: WeatherMain.rain, description: 'very heavy rain', iconID: 10),
    504: WeatherDescriptor(main: WeatherMain.rain, description: 'extreme rain', iconID: 10),
    511: WeatherDescriptor(main: WeatherMain.rain, description: 'freezing rain', iconID: 13),
    520: WeatherDescriptor(main: WeatherMain.rain, description: 'light intensity shower rain', iconID: 9),
    521: WeatherDescriptor(main: WeatherMain.rain, description: 'shower rain', iconID: 9),
    522: WeatherDescriptor(main: WeatherMain.rain, description: 'heavy intensity shower rain', iconID: 9),
    531: WeatherDescriptor(main: WeatherMain.rain, description: 'ragged shower rain', iconID: 9),
    600: WeatherDescriptor(main: WeatherMain.snow, description: 'light snow', iconID: 13),
    601: WeatherDescriptor(main: WeatherMain.snow, description: 'snow', iconID: 13),
    602: WeatherDescriptor(main: WeatherMain.snow, description: 'heavy snow', iconID: 13),
    611: WeatherDescriptor(main: WeatherMain.snow, description: 'sleet', iconID: 13),
    612: WeatherDescriptor(main: WeatherMain.snow, description: 'light shower sleet', iconID: 13),
    613: WeatherDescriptor(main: WeatherMain.snow, description: 'shower sleet', iconID: 13),
    615: WeatherDescriptor(main: WeatherMain.snow, description: 'light rain and snow', iconID: 13),
    616: WeatherDescriptor(main: WeatherMain.snow, description: 'rain and snow', iconID: 13),
    620: WeatherDescriptor(main: WeatherMain.snow, description: 'light shower snow', iconID: 13),
    621: WeatherDescriptor(main: WeatherMain.snow, description: 'shower snow', iconID: 13),
    622: WeatherDescriptor(main: WeatherMain.snow, description: 'heavy shower snow', iconID: 13),
    701: WeatherDescriptor(main: WeatherMain.mist, description: 'mist', iconID: 50),
    711: WeatherDescriptor(main: WeatherMain.smoke, description: 'smoke', iconID: 50),
    721: WeatherDescriptor(main: WeatherMain.haze, description: 'haze', iconID: 50),
    731: WeatherDescriptor(main: WeatherMain.dust, description: 'sand/dust whirls', iconID: 50),
    741: WeatherDescriptor(main: WeatherMain.fog, description: 'fog', iconID: 50),
    751: WeatherDescriptor(main: WeatherMain.sand, description: 'sand', iconID: 50),
    761: WeatherDescriptor(main: WeatherMain.dust, description: 'dust', iconID: 50),
    762: WeatherDescriptor(main: WeatherMain.ash, description: 'volcanic ash', iconID: 50),
    771: WeatherDescriptor(main: WeatherMain.squall, description: 'squalls', iconID: 50),
    781: WeatherDescriptor(main: WeatherMain.tornado, description: 'tornado', iconID: 50),
    800: WeatherDescriptor(main: WeatherMain.clear, description: 'clear sky', iconID: 1),
    801: WeatherDescriptor(main: WeatherMain.cloudy, description: 'few clouds: 11-25%', iconID: 2),
    802: WeatherDescriptor(main: WeatherMain.cloudy, description: 'scattered clouds: 25-50%', iconID: 3),
    803: WeatherDescriptor(main: WeatherMain.cloudy, description: 'broken clouds: 51-84%', iconID: 4),
    804: WeatherDescriptor(main: WeatherMain.cloudy, description: 'overcast clouds: 85-100%', iconID: 4),
  };
}

class WeatherDescriptor {
  final WeatherMain _main;
  final String _description;
  final int iconID;

  const WeatherDescriptor({required WeatherMain main, required String description, required this.iconID})
      : _main = main,
        _description = description;

  String get main => _main.toDisplay;
  String get description => _description.toCapitalized() + '.';
}

enum WeatherMain { thunderstorm, drizzle, rain, snow, mist, smoke, haze, dust, fog, sand, ash, squall, tornado, clear, cloudy }

extension WeatherMainDescriptionExtension on WeatherMain {
  String get toDisplay => toString().split('.').last.toTitleCase;
}
