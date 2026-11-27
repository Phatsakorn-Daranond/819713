import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_ui.dart';

void main() {
  runApp(const SAUDeveloperApp());
}

class SAUDeveloperApp extends StatelessWidget {
  const SAUDeveloperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SAU Developer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF35C2C1),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.urbanist().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
      ),
      home: const HomeUI(),
    );
  }
}
