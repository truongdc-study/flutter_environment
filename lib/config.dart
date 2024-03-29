import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class Config {
  static String apiBaseUrl = '';
  static bool debug = false;
  static String flavorSrt = '';

  static Future load() async {
    try {

      String flavor = await platformChannel.invokeMethod("flavor_method");
      String configString = '';
      if (flavor == 'dev') {
        configString = await rootBundle.loadString('.env_development');
      } else {
        configString = await rootBundle.loadString('.env_production');
      }
      final config = json.decode(configString) as Map<String, dynamic>;
      apiBaseUrl = config['API_BASE_URL'] ?? '';
      debug = bool.parse(config['DEBUG'] ?? 'true');
      flavorSrt = flavor;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static const platformChannel = MethodChannel("environment_flutter_channel");
}
