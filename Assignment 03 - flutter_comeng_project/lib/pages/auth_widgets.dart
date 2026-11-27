import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const sauDark = Color(0xFF1E232C);
const sauTeal = Color(0xFF16C5C5);
const sauGrey = Color(0xFF8493A8);
const sauField = Color(0xFFF6F7F8);

TextStyle sauText(double size, {FontWeight weight = FontWeight.w400, Color color = sauDark}) =>
    GoogleFonts.urbanist(fontSize: size, fontWeight: weight, color: color);

class BackControl extends StatelessWidget {
  const BackControl({super.key});
  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerLeft,
    child: SizedBox(
      width: 42, height: 42,
      child: OutlinedButton(
        onPressed: () => Navigator.pop(context),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          side: const BorderSide(color: Color(0xFFE1E6ED)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        ),
        child: const Icon(Icons.chevron_left, color: sauDark, size: 26),
      ),
    ),
  );
}

class SauField extends StatelessWidget {
  final String hint;
  final bool password;
  const SauField({super.key, required this.hint, this.password = false});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 56,
    child: TextField(
      obscureText: password,
      style: sauText(15),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: sauText(15, color: sauGrey),
        filled: true,
        fillColor: sauField,
        contentPadding: const EdgeInsets.symmetric(horizontal: 17),
        suffixIcon: password ? const Icon(Icons.visibility_outlined, size: 19, color: Color(0xFF68717E)) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: Color(0xFF858B91)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: Color(0xFF858B91)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: sauTeal, width: 1.5),
        ),
      ),
    ),
  );
}

class SauButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const SauButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity, height: 56,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: sauDark,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      ),
      child: Text(label, style: sauText(16, color: Colors.white, weight: FontWeight.w600)),
    ),
  );
}

void sauMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
