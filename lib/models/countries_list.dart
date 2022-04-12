import 'package:climaa/models/helpers/json_shared_functions.dart';
import 'package:flutter/services.dart';

Future<Map<String, String?>> countriesList() async {
  Map<String, dynamic> _countriesList = await JSON.decodeFrom(url: 'assets/json/country.json');
  return _countriesList.map((key, value) => MapEntry(key, value?.toString()));
}

Future<String?> getCountryName({required String fromCode}) async {
  Map<String, String?> countries = await countriesList();
  return countries[fromCode.toUpperCase()];
}

Future<String?> getCountryCode({required String fromCountryName}) async {
  Map<String, String?> countries = await countriesList();
  String? code =
      countries.keys.firstWhere((element) => countries[element]?.toLowerCase() == fromCountryName.toLowerCase(), orElse: () => 'Cannot find country');

  return code;
}
