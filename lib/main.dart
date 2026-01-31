import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:write_only/core/screen/Start/FirstScreen.dart';
import 'package:write_only/core/screen/Home/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final prefs = await SharedPreferences.getInstance();
  final String? savedUsername = prefs.getString('username');

  runApp(MyApp(savedUsername: savedUsername));
}

class MyApp extends StatelessWidget {
  final String? savedUsername;
  const MyApp({super.key, this.savedUsername});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: savedUsername != null
          ? Homescreen(username: savedUsername!)
          : const Firstscreen(),
    );
  }
}
