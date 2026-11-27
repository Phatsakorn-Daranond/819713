import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'e06_page_ui.dart';

class E05PageUI extends StatefulWidget {
  final String email;
  const E05PageUI({super.key, required this.email});

  @override
  State<E05PageUI> createState() => _E05PageUIState();
}

class _E05PageUIState extends State<E05PageUI> {
  final _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final scale = constraints.maxWidth / 360;
          final topOffset = (constraints.maxHeight - 800 * scale) / 2;

          return Stack(
            children: [
              Positioned(
                left: 35 * scale,
                top: topOffset + 105 * scale,
                width: 290 * scale,
                height: 290 * scale,
                child: Image.asset(
                  'assets/images/otp_illustration.png',
                  fit: BoxFit.contain,
                ),
              ),
              Positioned(
                left: 20 * scale,
                top: topOffset + 36 * scale,
                width: 32 * scale,
                height: 32 * scale,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset('assets/icons/otp_back.svg'),
                ),
              ),
              Positioned(
                left: 60 * scale,
                top: topOffset + 39 * scale,
                child: Text(
                  'OTP Verification',
                  style: TextStyle(
                    fontSize: 20 * scale,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 423 * scale,
                child: Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 20 * scale,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 453 * scale,
                width: 300 * scale,
                child: Text(
                  'An 4 digit code has been sent to your email',
                  style: TextStyle(
                    fontSize: 13 * scale,
                    color: const Color(0xFF575757),
                  ),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 505 * scale,
                width: 300 * scale,
                height: 50 * scale,
                child: TextField(
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22 * scale,
                    letterSpacing: 18 * scale,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: '• • • •',
                    filled: true,
                    fillColor: const Color(0xFFE3E3E3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10 * scale),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 47 * scale,
                top: topOffset + 568 * scale,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 13 * scale,
                      color: const Color(0xFF575757),
                    ),
                    children: const [
                      TextSpan(text: 'You should recieve the OTP in '),
                      TextSpan(
                        text: '30 Second',
                        style: TextStyle(color: Color(0xFFED6400)),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 608 * scale,
                width: 300 * scale,
                height: 50 * scale,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF79515),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15 * scale),
                    ),
                  ),
                  onPressed: () {
                    if (!RegExp(r'^\d{4}$').hasMatch(_otpController.text)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter 4 digit OTP'),
                        ),
                      );
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const E06PageUI()),
                    );
                  },
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      fontSize: 20 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
