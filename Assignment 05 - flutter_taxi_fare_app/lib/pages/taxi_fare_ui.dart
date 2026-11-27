import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_screen_ui.dart';

class TaxiFareUI extends StatefulWidget {
  const TaxiFareUI({super.key});

  @override
  State<TaxiFareUI> createState() => _TaxiFareUIState();
}

class _TaxiFareUIState extends State<TaxiFareUI> {
  final distanceController = TextEditingController();
  final trafficController = TextEditingController();

  double fare = 0;
  bool calculated = false;

  static const yellow = Color(0xFFFFC107);
  static const background = Color(0xFFFFF8FF);

  double calculateDistanceFare(double km) {
    if (km <= 0) return 0;

    double total = 35;
    if (km <= 1) return total;

    double remaining = km - 1;

    // กิโลเมตรที่ 2–10
    final firstRange = remaining.clamp(0.0, 9.0);
    total += firstRange * 6.50;
    remaining -= firstRange;

    // กิโลเมตรที่ 11–20
    final secondRange = remaining.clamp(0.0, 10.0);
    total += secondRange * 7.00;
    remaining -= secondRange;

    // กิโลเมตรที่ 21–40
    final thirdRange = remaining.clamp(0.0, 20.0);
    total += thirdRange * 8.00;
    remaining -= thirdRange;

    // กิโลเมตรที่ 41–60
    final fourthRange = remaining.clamp(0.0, 20.0);
    total += fourthRange * 8.50;
    remaining -= fourthRange;

    // กิโลเมตรที่ 61–80
    final fifthRange = remaining.clamp(0.0, 20.0);
    total += fifthRange * 9.00;
    remaining -= fifthRange;

    // ระยะทางเกิน 80 กิโลเมตร
    if (remaining > 0) {
      total += remaining * 10.50;
    }

    return total;
  }

  void calculateFare() {
    final distance = double.tryParse(distanceController.text.trim());
    final traffic = double.tryParse(trafficController.text.trim());

    if (distance == null ||
        traffic == null ||
        distance <= 0 ||
        traffic < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFF44336),
          behavior: SnackBarBehavior.fixed,
          content: Row(
            children: [
              const Icon(Icons.warning_amber_rounded,
                  color: yellow, size: 25),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'กรุณากรอกข้อมูลให้ครบถ้วนและถูกต้อง',
                  style: GoogleFonts.kanit(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
      return;
    }

    setState(() {
      fare = calculateDistanceFare(distance) + (traffic * 3);
      calculated = true;
    });
  }

  void clearData() {
    distanceController.clear();
    trafficController.clear();
    setState(() {
      fare = 0;
      calculated = false;
    });
  }

  @override
  void dispose() {
    distanceController.dispose();
    trafficController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: yellow,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 56,
        title: Text(
          'Taxi Fare',
          style: GoogleFonts.kanit(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(38, 22, 38, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 230,
                child: CustomPaint(painter: TaxiPainter()),
              ),
              const SizedBox(height: 12),
              Text(
                'คำนวณค่าโดยสารแท็กซี่',
                textAlign: TextAlign.center,
                style: GoogleFonts.kanit(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF29272D),
                ),
              ),
              const SizedBox(height: 22),
              _field(
                'ระยะทาง (กิโลเมตร) 🛣️',
                'กรุณากรอกระยะทาง',
                distanceController,
              ),
              const SizedBox(height: 20),
              _field(
                'เวลารถติด (นาที) ⏰',
                'กรุณากรอกเวลารถติด',
                trafficController,
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: calculateFare,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: yellow,
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'คำนวณค่าโดยสาร',
                    style: GoogleFonts.kanit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: clearData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade500,
                    foregroundColor: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'ยกเลิก',
                    style: GoogleFonts.kanit(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEDB3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      'ค่าโดยสารแท็กซี่',
                      style: GoogleFonts.kanit(
                        fontSize: 18,
                        color: const Color(0xFF55504A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      fare.toStringAsFixed(2),
                      style: GoogleFonts.kanit(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                        color: const Color(0xFFF44336),
                      ),
                    ),
                    Text(
                      'บาท',
                      style: GoogleFonts.kanit(
                        fontSize: 18,
                        color: const Color(0xFF55504A),
                      ),
                    ),
                  ],
                ),
              ),
              if (calculated) ...[
                const SizedBox(height: 12),
                Text(
                  'คำนวณจากระยะทางและเวลารถติดที่กรอก',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
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
        Text(
          label,
          style: GoogleFonts.kanit(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF29272D),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: GoogleFonts.kanit(fontSize: 16),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.kanit(
              fontSize: 15,
              color: const Color(0xFF77717B),
            ),
            filled: false,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(0xFF99919C),
                width: 1.2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(0xFF99919C),
                width: 1.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: yellow,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
