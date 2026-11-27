import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'e03_page_ui.dart';
import 'e05_page_ui.dart';

class E04PageUI extends StatefulWidget {
  const E04PageUI({super.key});

  @override
  State<E04PageUI> createState() => _E04PageUIState();
}

class _E04PageUIState extends State<E04PageUI> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  static const orange = Color(0xFFF79515);

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
                left: -70 * scale,
                top: topOffset - 175 * scale,
                width: 482.314 * scale,
                height: 487.086 * scale,
                child: Image.asset('assets/images/forgot_ellipse.png'),
              ),
              Positioned(
                left: 20 * scale,
                top: topOffset + 36 * scale,
                width: 32 * scale,
                height: 32 * scale,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset('assets/icons/forgot_back.svg'),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 347 * scale,
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                    fontSize: 20 * scale,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 377 * scale,
                child: Text(
                  'Enter email address',
                  style: TextStyle(fontSize: 15 * scale),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 408 * scale,
                width: 300 * scale,
                height: 46 * scale,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 13 * scale),
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    hintStyle: TextStyle(
                      color: const Color(0xFF8B8B8B),
                      fontSize: 12 * scale,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 14 * scale,
                      vertical: 12 * scale,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10 * scale),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 479 * scale,
                width: 300 * scale,
                height: 50 * scale,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: orange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15 * scale),
                    ),
                  ),
                  onPressed: () {
                    final email = _emailController.text.trim();
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid email'),
                        ),
                      );
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => E05PageUI(email: email),
                      ),
                    );
                  },
                  child: Text(
                    'Send code',
                    style: TextStyle(
                      fontSize: 20 * scale,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 60 * scale,
                top: topOffset + 752 * scale,
                child: Row(
                  children: [
                    Text(
                      'Don’t have an Account? ',
                      style: TextStyle(fontSize: 12 * scale),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const E03PageUI()),
                      ),
                      child: Text(
                        'Create Account',
                        style: TextStyle(fontSize: 12 * scale, color: orange),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
