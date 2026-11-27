import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/splash_screen_ui.dart';

void main() {
  runApp(const CakeShopApp());
}

class CakeShopApp extends StatelessWidget {
  const CakeShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'สายด่วนกินเค้ก',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.kanit().fontFamily,
        scaffoldBackgroundColor: const Color(0xFFFFF7FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF44336),
          primary: const Color(0xFFF44336),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFF44336),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: GoogleFonts.kanit(
            fontSize: 21,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      home: const SplashScreenUI(),
    );
  }
}
