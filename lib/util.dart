import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<List<dynamic>> parseJsonFromAssets(String assetsPath) async {
  return rootBundle
      .loadString(assetsPath)
      .then((jsonStr) => jsonDecode(jsonStr));
}

bool get isDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

DateTime parseDate(val) => val == null ? null : DateTime.parse(val);