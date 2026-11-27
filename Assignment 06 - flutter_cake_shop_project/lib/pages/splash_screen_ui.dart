import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cake_shop_list_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const CakeShopListUI()),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/bg_welcome.png',
            fit: BoxFit.cover,
          ),
          Container(color: const Color(0x44FFFFFF)),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.13,
            left: 12,
            right: 12,
            child: Column(
              children: [
                Text(
                  'สายด่วนกินเค้ก',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 37,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF00000),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'CAKE CALL FAST',
                  style: GoogleFonts.kanit(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFEF5350),
                  ),
                ),
                const SizedBox(height: 20),
                const CircularProgressIndicator(
                  color: Color(0xFF37474F),
                  strokeWidth: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
