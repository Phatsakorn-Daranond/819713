import 'package:flutter/material.dart';
import 'auth_widgets.dart';
import 'login_ui.dart';

class NewPasswordUI extends StatelessWidget {
  const NewPasswordUI({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Spacer(),
        Container(
          width: 100, height: 100,
          decoration: const BoxDecoration(color: Color(0xFF16C47F), shape: BoxShape.circle),
          child: const Icon(Icons.check, size: 62, color: Colors.white),
        ),
        const SizedBox(height: 34),
        Text('Password Changed!', textAlign: TextAlign.center,
          style: sauText(27, weight: FontWeight.w800)),
        const SizedBox(height: 8),
        Text('Your password has been changed\\nsuccessfully.',
          textAlign: TextAlign.center, style: sauText(16, color: sauGrey)),
        const SizedBox(height: 62),
        SauButton(label: 'Back to Login', onPressed: () => Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (_) => const LoginUI()), (route) => false)),
        const Spacer(),
      ]),
    )),
  );
}
