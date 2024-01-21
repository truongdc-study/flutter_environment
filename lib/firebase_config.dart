import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseConfig {
  static String srtFirebaseEnvironment = '';
  final _remoConfig = FirebaseRemoteConfig.instance;
  static Future loadFirebase() async {
    await FirebaseRemoteConfig.instance.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ),
    );
    RemoteConfigValue(null, ValueSource.valueStatic);
    await FirebaseRemoteConfig.instance.fetchAndActivate();
    srtFirebaseEnvironment = FirebaseRemoteConfig.instance.getString('evn_firebase');
  }
}
