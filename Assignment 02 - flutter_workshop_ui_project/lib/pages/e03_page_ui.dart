
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'e02_page_ui.dart';

class E03PageUI extends StatefulWidget {
  const E03PageUI({super.key});

  @override
  State<E03PageUI> createState() => _E03PageUIState();
}

class _E03PageUIState extends State<E03PageUI> {
  static const Color orange = Color(0xFFF79515);
  static const Color yellow = Color(0xFFFFC52A);
  static const Color grey = Color(0xFF8B8B8B);

  bool _obscurePassword = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _buildTextField({
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Container(
      width: 300,
      height: 46,
      decoration: BoxDecoration(
        border: Border.all(color: grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 12,
            color: grey,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 13,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String asset, String name) {
    return GestureDetector(
      onTap: () => _showMessage('$name sign up pressed'),
      child: SizedBox(
        width: 32,
        height: 32,
        child: SvgPicture.asset(asset),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final scale = math.min(
            constraints.maxWidth / 360,
            constraints.maxHeight / 800,
          );

          return Center(
            child: Transform.scale(
              scale: scale,
              child: SizedBox(
                width: 360,
                height: 800,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Background ellipse
                    Positioned(
                      left: -70,
                      top: -287,
                      width: 482.314,
                      height: 487.086,
                      child: Image.asset(
                        'assets/images/register_ellipse.png',
                        fit: BoxFit.fill,
                      ),
                    ),

                    // Register title
                    const Positioned(
                      top: 180,
                      left: 0,
                      right: 0,
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    // Subtitle
                    const Positioned(
                      top: 225,
                      left: 0,
                      right: 0,
                      child: Text(
                        'Create your new account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    // Name
                    Positioned(
                      left: 31,
                      top: 277,
                      child: _buildTextField(
                        hint: 'Name',
                        controller: _nameController,
                      ),
                    ),

                    // Email
                    Positioned(
                      left: 31,
                      top: 333,
                      child: _buildTextField(
                        hint: 'E-mail',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),

                    // Phone
                    Positioned(
                      left: 31,
                      top: 389,
                      child: _buildTextField(
                        hint: 'Phone',
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                    ),

                    // Password
                    Positioned(
                      left: 31,
                      top: 445,
                      child: SizedBox(
                        width: 300,
                        height: 46,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: grey, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            style: const TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                color: grey,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 13,
                              ),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  size: 18,
                                  color: grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Terms and conditions
                    Positioned(
                      left: 24,
                      top: 511,
                      width: 312,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(
                              text: 'By signing up you agree to our ',
                            ),
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: const TextStyle(
                                color: orange,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            const TextSpan(
                              text: ' and ',
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: const TextStyle(
                                color: orange,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Sign Up button
                    Positioned(
                      left: 30,
                      top: 567,
                      width: 300,
                      height: 50,
                      child: GestureDetector(
                        onTap: () {
                          if (_nameController.text.isEmpty ||
                              _emailController.text.isEmpty ||
                              _phoneController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            _showMessage('Please fill in all fields');
                          } else {
                            _showMessage('Sign Up button pressed');
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [yellow, orange],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // OR separator
                    const Positioned(
                      left: 0,
                      right: 0,
                      top: 632,
                      child: Text(
                        'OR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Positioned(
                      left: 36,
                      top: 647,
                      width: 120,
                      height: 2,
                      child: SvgPicture.asset(
                        'assets/icons/register_line_left.svg',
                        fit: BoxFit.fill,
                      ),
                    ),

                    Positioned(
                      right: 36,
                      top: 647,
                      width: 120,
                      height: 2,
                      child: SvgPicture.asset(
                        'assets/icons/register_line_right.svg',
                        fit: BoxFit.fill,
                      ),
                    ),

                    // Social login icons
                    Positioned(
                      left: 102,
                      top: 691,
                      child: _buildSocialIcon(
                        'assets/icons/register_google.svg',
                        'Google',
                      ),
                    ),

                    Positioned(
                      left: 164,
                      top: 691,
                      child: _buildSocialIcon(
                        'assets/icons/register_facebook.svg',
                        'Facebook',
                      ),
                    ),

                    Positioned(
                      left: 226,
                      top: 691,
                      child: _buildSocialIcon(
                        'assets/icons/register_apple.svg',
                        'Apple',
                      ),
                    ),

                    // Already have an account
                    Positioned(
                      left: 60,
                      top: 752,
                      child: Row(
                        children: [
                          const Text(
                            'Already have an Account? ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const E02PageUI(),
                                ),
                              );
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 12,
                                color: orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
