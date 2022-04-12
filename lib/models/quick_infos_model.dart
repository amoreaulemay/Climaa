class QuickInfosModel {
  final double _humidity;
  final double _pressure;
  final double _windSpeed;
  final PressureUnits pressureUnits;
  final WindSpeedUnits windSpeedUnits;

  const QuickInfosModel({
    required double humidity,
    required double pressure,
    required double windSpeed,
    required this.pressureUnits,
    required this.windSpeedUnits,
  })  : _humidity = humidity,
        _pressure = pressure,
        _windSpeed = windSpeed;

  const QuickInfosModel.si({
    required double humidity,
    required double pressure,
    required double windSpeed,
  })  : _humidity = humidity,
        _pressure = pressure,
        _windSpeed = windSpeed,
        pressureUnits = PressureUnits.pascal,
        windSpeedUnits = WindSpeedUnits.mps;

  String get humidity => '${_humidity.toStringAsFixed(0)} %';
  String get pressure => '${_pressure.toStringAsFixed(1)} ${pressureUnits.display}';
  String get windSpeed => '${_windSpeed.toStringAsFixed(0)} ${windSpeedUnits.display}';
}

enum PressureUnits { mbar, atm, mmhg, pascal }
enum WindSpeedUnits { mps, kph, mph }

extension PressureUnitsExtension on PressureUnits {
  String get display {
    switch (this) {
      case PressureUnits.mbar:
        return 'mBar';
      case PressureUnits.atm:
        return 'atm';
      case PressureUnits.mmhg:
        return 'mmHg';
      case PressureUnits.pascal:
        return 'Pa';
    }
  }
}

extension WindSpeedUnitsExtension on WindSpeedUnits {
  String get display {
    switch (this) {
      case WindSpeedUnits.mps:
        return 'm/s';
      case WindSpeedUnits.kph:
        return 'km/h';
      case WindSpeedUnits.mph:
        return 'mi/h';
    }
  }
}
