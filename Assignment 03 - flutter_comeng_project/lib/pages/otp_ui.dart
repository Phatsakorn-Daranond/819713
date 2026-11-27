import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'auth_widgets.dart';
import 'password_change_ui.dart';

class OtpUI extends StatelessWidget {
  const OtpUI({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const BackControl(),
        const SizedBox(height: 30),
        Text('OTP Verification', style: sauText(29, weight: FontWeight.w800)),
        const SizedBox(height: 12),
        Text('Enter the verification code we just sent on your email address.',
          style: sauText(16, color: sauGrey)),
        const SizedBox(height: 30),
        Row(children: List.generate(4, (index) => Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: index == 3 ? 0 : 16),
            child: SizedBox(height: 60, child: TextField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: sauText(22, weight: FontWeight.w700),
              decoration: InputDecoration(
                counterText: '',
                filled: true,
                fillColor: sauField,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: Color(0xFF858B91))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: Color(0xFF858B91))),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(9), borderSide: const BorderSide(color: sauTeal)),
              ),
            )),
          ),
        ))),
        const SizedBox(height: 38),
        SauButton(label: 'Verify', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PasswordChangeUI()))),
      ]),
    )),
  );
}
