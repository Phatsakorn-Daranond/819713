import 'package:flutter/material.dart';
import 'pages/splash_screen_ui.dart';

void main() {
  runApp(const BodyHealthCalculatorApp());
}

class BodyHealthCalculatorApp extends StatelessWidget {
  const BodyHealthCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Body ว้าว',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8FF),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDF3000),
        ),
      ),
      home: const SplashScreenUI(),
    );
  }
}


