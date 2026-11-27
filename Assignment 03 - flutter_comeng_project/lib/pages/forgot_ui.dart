import 'package:flutter/material.dart';
import 'auth_widgets.dart';
import 'otp_ui.dart';

class ForgotUI extends StatelessWidget {
  const ForgotUI({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(child: LayoutBuilder(builder: (context, box) =>
      Padding(
        padding: const EdgeInsets.fromLTRB(22, 24, 22, 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const BackControl(),
          const SizedBox(height: 30),
          Text('Forgot Password?', style: sauText(29, weight: FontWeight.w800)),
          const SizedBox(height: 12),
          Text("Don't worry! It occurs. Please enter the email address linked with your account.",
            style: sauText(16, color: sauGrey),),
          const SizedBox(height: 30),
          const SauField(hint: 'Enter your email'),
          const SizedBox(height: 38),
          SauButton(label: 'Send Code', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OtpUI()))),
          const Spacer(),
          Center(child: Wrap(children: [
            Text('Remember Password? ', style: sauText(14)),
            GestureDetector(onTap: () => Navigator.pop(context), child: Text('Login', style: sauText(14, color: sauTeal, weight: FontWeight.w700))),
          ])),
        ]),
      ),
    )),
  );
}
