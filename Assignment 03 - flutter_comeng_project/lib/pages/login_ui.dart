import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth_widgets.dart';
import 'forgot_ui.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: LayoutBuilder(builder: (context, box) =>
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(22, 24, 22, 20),
          child: SizedBox(
            height: box.maxHeight - 44,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const BackControl(),
              const SizedBox(height: 30),
              Text('Welcome to SAU! Glad\\nto see you. Again!',
                style: sauText(29, weight: FontWeight.w800)),
              const SizedBox(height: 32),
              const SauField(hint: 'Enter your email'),
              const SizedBox(height: 15),
              const SauField(hint: 'Enter your password', password: true),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotUI())),
                  child: Text('Forgot Password?', style: sauText(14, color: const Color(0xFF626B7A), weight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 10),
              SauButton(label: 'Login', onPressed: () => sauMessage(context, 'Login selected')),
              const SizedBox(height: 32),
              Center(child: Text('Or Login with', style: sauText(15, color: const Color(0xFF626B7A)))),
              const SizedBox(height: 20),
              Row(children: [
                _Social(icon: FontAwesomeIcons.facebookF, color: const Color(0xFF1877F2)),
                const SizedBox(width: 8),
                _Social(icon: FontAwesomeIcons.google, color: const Color(0xFFEA4335)),
                const SizedBox(width: 8),
                _Social(icon: FontAwesomeIcons.apple, color: Colors.black),
              ]),
              const Spacer(),
              Center(child: Wrap(alignment: WrapAlignment.center, children: [
                Text('Don’t have an account? ', style: sauText(14)),
                GestureDetector(
                  onTap: () => sauMessage(context, 'Register Now'),
                  child: Text('Register Now', style: sauText(14, color: sauTeal, weight: FontWeight.w700)),
                ),
              ])),
            ]),
          ),
        ),
      )),
    );
  }
}

class _Social extends StatelessWidget {
  final FaIconData icon;
  final Color color;
  const _Social({required this.icon, required this.color});
  @override
  Widget build(BuildContext context) => Expanded(child: SizedBox(
    height: 56,
    child: OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFB7C8FF)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
      child: FaIcon(icon, color: color, size: 22),
    ),
  ));
}

