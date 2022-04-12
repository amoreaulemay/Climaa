import 'dart:convert';

import 'package:flutter/services.dart';

class JSON {
  /// Loads a json file into a string.
  static Future<String> readJson(String url) async => await rootBundle.loadString(url);

  /// Serialize the JSON into a [Map<String, dynamic>].
  static Future<Map<String, dynamic>> decodeFrom({required String url}) async => jsonDecode(await readJson(url));
}
