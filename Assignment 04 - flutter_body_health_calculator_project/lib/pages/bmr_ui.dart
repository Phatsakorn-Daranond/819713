import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmrUI extends StatefulWidget {
  const BmrUI({super.key});

  @override
  State<BmrUI> createState() => _BmrUIState();
}

class _BmrUIState extends State<BmrUI> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final ageController = TextEditingController();

  String gender = 'ชาย';
  double bmr = 0;

  void calculateBMR() {
    final weight = double.tryParse(weightController.text);
    final height = double.tryParse(heightController.text);
    final age = double.tryParse(ageController.text);

    if (weight == null || height == null || age == null ||
        weight <= 0 || height <= 0 || age <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'กรุณากรอกข้อมูลให้ถูกต้อง',
            style: GoogleFonts.kanit(),
          ),
        ),
      );
      return;
    }

    final value = gender == 'ชาย'
        ? 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
        : 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);

    setState(() => bmr = value);
  }

  void clearData() {
    weightController.clear();
    heightController.clear();
    ageController.clear();
    setState(() => bmr = 0);
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(32, 24, 32, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'คำนวณหาอัตราการเผาผลาญที่\\nร่างกายต้องการ (BMR)',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF424242),
                ),
              ),
              const SizedBox(height: 18),
              Container(
                height: 145,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE0D6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_rounded,
                        size: 78, color: Color(0xFFDF3000)),
                    SizedBox(width: 20),
                    Icon(Icons.local_fire_department_rounded,
                        size: 78, color: Color(0xFFFF8A00)),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Text('เพศ', style: GoogleFonts.kanit(fontSize: 13)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(child: _genderButton('ชาย')),
                  const SizedBox(width: 14),
                  Expanded(child: _genderButton('หญิง')),
                ],
              ),
              const SizedBox(height: 16),
              _field('น้ำหนัก (kg.)', 'กรอกน้ำหนักของคุณ', weightController),
              const SizedBox(height: 14),
              _field('ส่วนสูง (cm.)', 'กรอกส่วนสูงของคุณ', heightController),
              const SizedBox(height: 14),
              _field('อายุ (ปี)', 'กรอกอายุของคุณ', ageController),
              const SizedBox(height: 24),
              _button('คำนวณ BMR', const Color(0xFFFF5722), calculateBMR),
              const SizedBox(height: 10),
              _button('ล้างข้อมูล', Colors.grey, clearData),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: const Color(0xFFC8E6C9),
                child: Column(
                  children: [
                    Text(
                      'BMR',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmr.toStringAsFixed(2),
                      style: GoogleFonts.kanit(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFF44336),
                      ),
                    ),
                    Text(
                      'kcal/day',
                      style: GoogleFonts.kanit(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
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
  }

  Widget _genderButton(String value) {
    final selected = gender == value;
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: () => setState(() => gender = value),
        style: ElevatedButton.styleFrom(
          backgroundColor: selected
              ? const Color(0xFFBBDEFB)
              : Colors.white,
          foregroundColor: selected
              ? const Color(0xFF1565C0)
              : Colors.grey,
          elevation: selected ? 2 : 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          value,
          style: GoogleFonts.kanit(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _field(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.kanit(fontSize: 13)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: GoogleFonts.kanit(fontSize: 14),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.kanit(fontSize: 13, color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 13,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.black38),
            ),
          ),
        ),
      ],
    );
  }

  Widget _button(String label, Color color, VoidCallback action) {
    return SizedBox(
      height: 46,
      child: ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 1,
          shape: const StadiumBorder(),
        ),
        child: Text(
          label,
          style: GoogleFonts.kanit(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

