import 'package:flutter/material.dart';
import 'pages/splash_screen_ui.dart';

void main() {
  runApp(const TaxiFareApp());
}

class TaxiFareApp extends StatelessWidget {
  const TaxiFareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi Fare Calculator',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFC107),
        ),
      ),
      home: const SplashScreenUI(),
    );
  }
}
