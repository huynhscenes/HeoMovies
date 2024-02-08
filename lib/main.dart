import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: FirebaseOptions(
      apiKey: "AIzaSyDJoeQYPEGOu92stnV-rk-uXG4hj1qvNpg",
      appId: "1:979027517313:ios:18ce2e4364360257a89280",
      messagingSenderId: "979027517313",
      projectId: "heomovie-e5bbb",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netflix Login',
      theme: ThemeData.dark(),
      home: HomeScreen(),
      // home: LoginScreen(),
    );
  }
}
