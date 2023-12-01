import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Config {
  static String apiBaseUrl = '';
  static bool debug = false;

  static Future load() async {
    try {
      const String flavor = String.fromEnvironment('FLAVOR', defaultValue: 'development');
      debugPrint(flavor);
      final configString = await rootBundle.loadString('.env_development');
      final config = json.decode(configString) as Map<String, dynamic>;

      apiBaseUrl = config['API_BASE_URL'] ?? '';
      debug =  bool.parse(config['DEBUG'] ?? 'true');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
