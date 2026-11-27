import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiUI extends StatefulWidget {
  const BmiUI({super.key});

  @override
  State<BmiUI> createState() => _BmiUIState();
}

class _BmiUIState extends State<BmiUI> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double bmi = 0;
  String result = '';

  void calculateBMI() {
    final weight = double.tryParse(weightController.text);
    final height = double.tryParse(heightController.text);

    if (weight == null || height == null || weight <= 0 || height <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'กรุณากรอกน้ำหนักและส่วนสูงให้ถูกต้อง',
            style: GoogleFonts.kanit(),
          ),
        ),
      );
      return;
    }

    final heightM = height / 100;
    final value = weight / (heightM * heightM);

    setState(() {
      bmi = value;
      if (value < 18.5) {
        result = 'น้ำหนักต่ำกว่าเกณฑ์';
      } else if (value < 23) {
        result = 'น้ำหนักสมส่วน';
      } else if (value < 25) {
        result = 'น้ำหนักเกิน';
      } else if (value < 30) {
        result = 'โรคอ้วนระดับ 1';
      } else {
        result = 'โรคอ้วนระดับ 2 หรืออ้วนมาก';
      }
    });
  }

  void clearData() {
    weightController.clear();
    heightController.clear();
    setState(() {
      bmi = 0;
      result = '';
    });
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(40, 24, 40, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF292929),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE0D6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.monitor_weight_rounded,
                        size: 82, color: Color(0xFFDF3000)),
                    SizedBox(width: 18),
                    Icon(Icons.straighten_rounded,
                        size: 65, color: Color(0xFFFF8A65)),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              _field('น้ำหนัก (kg.)', 'กรอกน้ำหนักของคุณ', weightController),
              const SizedBox(height: 18),
              _field('ส่วนสูง (cm.)', 'กรอกส่วนสูงของคุณ', heightController),
              const SizedBox(height: 24),
              _button('คำนวณ BMI', const Color(0xFFFF5722), calculateBMI),
              const SizedBox(height: 10),
              _button('ล้างข้อมูล', Colors.grey, clearData),
              const SizedBox(height: 22),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: const Color(0xFFC8E6C9),
                child: Column(
                  children: [
                    Text(
                      'BMI',
                      style: GoogleFonts.kanit(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(2),
                      style: GoogleFonts.kanit(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFF44336),
                      ),
                    ),
                    Text(
                      result.isEmpty ? 'การแปลผล' : result,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kanit(
                        fontSize: 16,
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

  Widget _field(
    String label,
    String hint,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.kanit(fontSize: 14)),
        const SizedBox(height: 7),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: GoogleFonts.kanit(fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.kanit(color: Colors.grey, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 17,
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
      height: 54,
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
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

