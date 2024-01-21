import 'package:environment_flutter/config.dart';
import 'package:environment_flutter/firebase_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Config.load();
  await FirebaseConfig.loadFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Environment'),
      ),
      body: Center(
        child: Text(
          'API: ${Config.apiBaseUrl}\nDebug: ${Config.debug} \nFlavor: ${Config.flavorSrt} \nFirebase: ${FirebaseConfig.srtFirebaseEnvironment} ',
        ),
      ),
    );
  }
}
