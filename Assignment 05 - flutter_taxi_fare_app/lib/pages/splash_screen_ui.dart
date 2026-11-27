import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'taxi_fare_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const TaxiFareUI()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 270,
              height: 220,
              child: CustomPaint(
                painter: TaxiPainter(),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Taxi Fare Calculator',
              style: GoogleFonts.kanit(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF64B5F6),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'คำนวณค่าโดยสารแท็กซี่',
              style: GoogleFonts.kanit(
                fontSize: 18,
                color: const Color(0xFF64B5F6),
              ),
            ),
            const SizedBox(height: 32),
            const SizedBox(
              width: 38,
              height: 38,
              child: CircularProgressIndicator(
                color: Color(0xFFFFC107),
                strokeWidth: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaxiPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const designWidth = 270.0;
    const designHeight = 220.0;

    // ใช้สเกลเดียวกันทั้งแนวนอนและแนวตั้ง
    final scale = (size.width / designWidth)
        .clamp(0.0, size.height / designHeight);

    // จัดรถให้อยู่ตรงกลางพื้นที่วาด
    final offsetX = (size.width - designWidth * scale) / 2;
    final offsetY = (size.height - designHeight * scale) / 2;

    canvas.save();
    canvas.translate(offsetX, offsetY);
    canvas.scale(scale);

    final yellow = Paint()..color = const Color(0xFFFFC400);
    final dark = Paint()..color = const Color(0xFF29272D);
    final glass = Paint()..color = const Color(0xFF9ED9EF);
    final bumper = Paint()..color = const Color(0xFF91A4B5);
    final white = Paint()..color = Colors.white;

    // Wheels
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(38, 151, 42, 48),
        const Radius.circular(9),
      ),
      dark,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(190, 151, 42, 48),
        const Radius.circular(9),
      ),
      dark,
    );

    // Taxi sign
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(94, 5, 82, 42),
        const Radius.circular(5),
      ),
      yellow,
    );

    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'TAXI',
        style: TextStyle(
          color: Color(0xFF29272D),
          fontSize: 26,
          fontWeight: FontWeight.w900,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    textPainter.paint(canvas, const Offset(105, 10));

    // Mirrors
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(12, 57, 37, 27),
        const Radius.circular(12),
      ),
      yellow,
    );

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(221, 57, 37, 27),
        const Radius.circular(12),
      ),
      yellow,
    );

    // Windshield and body
    final windshield = Path()
      ..moveTo(72, 48)
      ..quadraticBezierTo(77, 42, 91, 42)
      ..lineTo(179, 42)
      ..quadraticBezierTo(194, 42, 200, 55)
      ..lineTo(218, 112)
      ..lineTo(52, 112)
      ..close();

    canvas.drawPath(windshield, yellow);

    final glassPath = Path()
      ..moveTo(82, 54)
      ..lineTo(188, 54)
      ..lineTo(205, 105)
      ..lineTo(65, 105)
      ..close();

    canvas.drawPath(glassPath, glass);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(28, 93, 214, 76),
        const Radius.circular(15),
      ),
      yellow,
    );

    // Front grille
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(83, 112, 104, 34),
        const Radius.circular(4),
      ),
      Paint()..color = const Color(0xFFE5AD00),
    );

    for (int i = 0; i < 7; i++) {
      canvas.drawRect(
        Rect.fromLTWH(91 + i * 13, 120, 8, 17),
        Paint()..color = const Color(0xFF666666),
      );
    }

    // Headlights
    canvas.drawRect(
      const Rect.fromLTWH(39, 112, 29, 16),
      white,
    );

    canvas.drawRect(
      const Rect.fromLTWH(202, 112, 29, 16),
      white,
    );

    // Bumper
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(24, 144, 222, 22),
        const Radius.circular(6),
      ),
      bumper,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
