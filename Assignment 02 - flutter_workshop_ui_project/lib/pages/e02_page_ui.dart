import 'e03_page_ui.dart';
import 'e04_page_ui.dart';

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class E02PageUI extends StatefulWidget {
  const E02PageUI({super.key});

  @override
  State<E02PageUI> createState() => _E02PageUIState();
}

class _E02PageUIState extends State<E02PageUI> {
  static const Color orange = Color(0xFFF69515);
  static const Color yellow = Color(0xFFFFC52A);
  static const Color grey = Color(0xFF8B8B8B);

  bool _obscurePassword = true;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          const designWidth = 360.0;
          const designHeight = 800.0;

          final scale = math.min(
            constraints.maxWidth / designWidth,
            constraints.maxHeight / designHeight,
          );

          final leftOffset = (constraints.maxWidth - designWidth * scale) / 2;

          final topOffset = (constraints.maxHeight - designHeight * scale) / 2;

          return Stack(
            children: [
              // Orange decorative background
              Positioned(
                left: leftOffset - 70 * scale,
                top: topOffset - 175 * scale,
                width: 482.314 * scale,
                height: 487.086 * scale,
                child: Image.asset(
                  'assets/images/login_ellipse.png',
                  fit: BoxFit.fill,
                ),
              ),

              // Back button
              Positioned(
                left: leftOffset + 20 * scale,
                top: topOffset + 36 * scale,
                width: 32 * scale,
                height: 32 * scale,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset('assets/icons/login_back.svg'),
                ),
              ),

              // Welcome title
              Positioned(
                left: leftOffset + 65 * scale,
                top: topOffset + 316 * scale,
                width: 270 * scale,
                child: Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 30 * scale,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              // Subtitle
              Positioned(
                left: leftOffset + 83 * scale,
                top: topOffset + 361 * scale,
                width: 250 * scale,
                child: Text(
                  'Login to your account',
                  style: TextStyle(fontSize: 18 * scale, color: Colors.black),
                ),
              ),

              // Email input
              Positioned(
                left: leftOffset + 30 * scale,
                top: topOffset + 408 * scale,
                width: 300 * scale,
                height: 46 * scale,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: grey, width: 1 * scale),
                    borderRadius: BorderRadius.circular(10 * scale),
                  ),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 12 * scale),
                    decoration: InputDecoration(
                      hintText: 'Enter email or phone',
                      hintStyle: TextStyle(color: grey, fontSize: 12 * scale),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 13 * scale,
                        vertical: 12 * scale,
                      ),
                    ),
                  ),
                ),
              ),

              // Password input
              Positioned(
                left: leftOffset + 30 * scale,
                top: topOffset + 464 * scale,
                width: 300 * scale,
                height: 46 * scale,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: grey, width: 1 * scale),
                    borderRadius: BorderRadius.circular(10 * scale),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: TextStyle(fontSize: 12 * scale),
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: grey, fontSize: 12 * scale),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        left: 13 * scale,
                        top: 12 * scale,
                        bottom: 12 * scale,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8 * scale),
                          child: SvgPicture.asset(
                            'assets/icons/login_eye_invisible.svg',
                            width: 29 * scale,
                            height: 24 * scale,
                          ),
                        ),
                      ),
                      suffixIconConstraints: BoxConstraints(
                        minWidth: 45 * scale,
                        minHeight: 40 * scale,
                      ),
                    ),
                  ),
                ),
              ),

              // Forgot password
              Positioned(
                left: leftOffset + 229 * scale,
                top: topOffset + 525 * scale,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const E04PageUI(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      fontSize: 11 * scale,
                      color: orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              // Log In button
              Positioned(
                left: leftOffset + 30 * scale,
                top: topOffset + 567 * scale,
                width: 300 * scale,
                height: 50 * scale,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [yellow, orange]),
                    borderRadius: BorderRadius.circular(15 * scale),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15 * scale),
                      onTap: () {
                        if (_emailController.text.trim().isEmpty ||
                            _passwordController.text.isEmpty) {
                          _showMessage('Please enter your email and password');
                        } else {
                          _showMessage('Login button pressed');
                        }
                      },
                      child: Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 20 * scale,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // OR separator
              Positioned(
                left: leftOffset + 36 * scale,
                top: topOffset + 632 * scale,
                width: 288 * scale,
                height: 25 * scale,
                child: Row(
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        'assets/icons/login_line_left.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(width: 10 * scale),
                    Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 20 * scale,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10 * scale),
                    Expanded(
                      child: SvgPicture.asset(
                        'assets/icons/login_line_right.svg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),

              // Social login icons
              Positioned(
                left: leftOffset + 102 * scale,
                top: topOffset + 691 * scale,
                width: 32 * scale,
                height: 32 * scale,
                child: GestureDetector(
                  onTap: () => _showMessage('Google login'),
                  child: SvgPicture.asset('assets/icons/login_google.svg'),
                ),
              ),

              Positioned(
                left: leftOffset + 164 * scale,
                top: topOffset + 691 * scale,
                width: 32 * scale,
                height: 32 * scale,
                child: GestureDetector(
                  onTap: () => _showMessage('Facebook login'),
                  child: SvgPicture.asset('assets/icons/login_facebook.svg'),
                ),
              ),

              Positioned(
                left: leftOffset + 226 * scale,
                top: topOffset + 691 * scale,
                width: 32 * scale,
                height: 32 * scale,
                child: GestureDetector(
                  onTap: () => _showMessage('Apple login'),
                  child: SvgPicture.asset('assets/icons/login_apple.svg'),
                ),
              ),

              // Create account
              Positioned(
                left: leftOffset + 60 * scale,
                top: topOffset + 752 * scale,
                width: 250 * scale,
                child: Row(
                  children: [
                    Text(
                      "Don't have an Account? ",
                      style: TextStyle(
                        fontSize: 12 * scale,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const E03PageUI(),
                          ),
                        );
                      },
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
