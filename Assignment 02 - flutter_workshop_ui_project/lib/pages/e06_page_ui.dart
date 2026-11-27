import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'e02_page_ui.dart';

class E06PageUI extends StatefulWidget {
  const E06PageUI({super.key});

  @override
  State<E06PageUI> createState() => _E06PageUIState();
}

class _E06PageUIState extends State<E06PageUI> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
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
                left: -70 * scale,
                top: topOffset - 175 * scale,
                width: 482.314 * scale,
                height: 487.086 * scale,
                child: Image.asset('assets/images/reset_ellipse.png'),
              ),
              Positioned(
                left: 20 * scale,
                top: topOffset + 36 * scale,
                width: 32 * scale,
                height: 32 * scale,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset('assets/icons/reset_back.svg'),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 326 * scale,
                child: Text(
                  'Create New Password',
                  style: TextStyle(
                    fontSize: 20 * scale,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 356 * scale,
                child: Text(
                  'Enter new password',
                  style: TextStyle(fontSize: 18 * scale),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 408 * scale,
                width: 300 * scale,
                height: 46 * scale,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter New password',
                    hintStyle: TextStyle(fontSize: 12 * scale),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 14 * scale,
                      vertical: 12 * scale,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10 * scale),
                      borderSide: const BorderSide(
                        color: Color(0xFFFFC52A),
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10 * scale),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30 * scale,
                top: topOffset + 464 * scale,
                width: 300 * scale,
                height: 46 * scale,
                child: TextField(
                  controller: _confirmController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm password',
                    hintStyle: TextStyle(fontSize: 12 * scale),
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
                top: topOffset + 535 * scale,
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
                    final password = _passwordController.text;
                    if (password.length < 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Password must be at least 6 characters',
                          ),
                        ),
                      );
                      return;
                    }
                    if (password != _confirmController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Passwords do not match')),
                      );
                      return;
                    }
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const E02PageUI()),
                      (route) => false,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password reset successfully'),
                      ),
                    );
                  },
                  child: Text(
                    'Submit',
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
