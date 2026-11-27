import 'package:flutter/material.dart';
import 'auth_widgets.dart';
import 'new_password_ui.dart';

class PasswordChangeUI extends StatelessWidget {
  const PasswordChangeUI({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const BackControl(),
        const SizedBox(height: 30),
        Text('Create new password', style: sauText(29, weight: FontWeight.w800)),
        const SizedBox(height: 12),
        Text('Your new password must be unique from those previously used.',
          style: sauText(16, color: sauGrey)),
        const SizedBox(height: 30),
        const SauField(hint: 'New Password', password: true),
        const SizedBox(height: 15),
        const SauField(hint: 'Confirm Password', password: true),
        const SizedBox(height: 38),
        SauButton(label: 'Reset Password', onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const NewPasswordUI()))),
      ]),
    )),
  );
}
