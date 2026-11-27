
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bmi_ui.dart';
import 'bmr_ui.dart';
import 'about_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int selectedIndex = 1;

  late final List<Widget> pages = [
    const BmiUI(),
    _HomeContent(onNavigate: (index) => setState(() => selectedIndex = index)),
    const BmrUI(),
  ];

  void openAbout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AboutUI(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFFFF8FF),
        selectedItemColor: const Color(0xFFDF3000),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.kanit(fontSize: 12),
        unselectedLabelStyle: GoogleFonts.kanit(fontSize: 12),
        onTap: (index) => setState(() => selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight_outlined),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: 'BMR',
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  final ValueChanged<int> onNavigate;

  const _HomeContent({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDF3000),
        foregroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 54,
        title: Text(
          'Body Health Calculator',
          style: GoogleFonts.kanit(
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUI(),
                ),
              );
            },
            icon: const Icon(Icons.info_outline),
            tooltip: 'About',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Text(
                  'Body Health Calculator',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF424242),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'ดูแลสุขภาพของคุณได้ง่าย ๆ',
                  style: GoogleFonts.kanit(
                    fontSize: 15,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFE0D6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.health_and_safety_rounded,
                    size: 125,
                    color: Color(0xFFDF3000),
                  ),
                ),
                const SizedBox(height: 30),
                _featureCard(
                  icon: Icons.monitor_weight_outlined,
                  title: 'BMI Calculator',
                  description: 'คำนวณค่าดัชนีมวลกาย',
                  color: const Color(0xFFDF3000),
                  onTap: () => onNavigate(0),
                ),
                const SizedBox(height: 14),
                _featureCard(
                  icon: Icons.local_fire_department_outlined,
                  title: 'BMR Calculator',
                  description: 'คำนวณพลังงานที่ร่างกายต้องการต่อวัน',
                  color: const Color(0xFFFF8A00),
                  onTap: () => onNavigate(2),
                ),
                const SizedBox(height: 35),
                const Icon(
                  Icons.account_balance,
                  size: 42,
                  color: Colors.grey,
                ),
                const SizedBox(height: 8),
                Text(
                  'Developed by Phatsakorn Daranond',
                  style: GoogleFonts.kanit(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _featureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, size: 38, color: color),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.kanit(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: GoogleFonts.kanit(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: color),
            ],
          ),
        ),
      ),
    );
  }
}




