import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Body Health Calculator',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFE64A19),
                  ),
                ),
                const SizedBox(height: 38),
                Image.asset(
                  'assets/images/about_01.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 34),
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFE64A19),
                  ),
                ),
                Text(
                  'คำนวณหาแคลอรี่ที่ร่างกายต้องการ (BMR)',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFE64A19),
                  ),
                ),
                const SizedBox(height: 65),
                Image.asset(
                  'assets/images/about_02.png',
                  width: 65,
                  height: 65,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 12),
                Text(
                  '© 2026 SAU. All rights reserved.',
                  style: GoogleFonts.kanit(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Created by SAU Software Development Team',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
