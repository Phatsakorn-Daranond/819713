import 'package:flutter/material.dart';

import 'travel_ui.dart';
import 'emg_ui.dart';
import 'bank_ui.dart';
import 'pub_ui.dart';
import 'about_ui.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  void _navigate(BuildContext context, int index) {
    final pages = [
      const HomeUI(),
      const TravelUI(),
      const EmgUI(),
      const BankUI(),
      const PubUI(),
    ];

    if (index == 0) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'title': 'การเดินทาง',
        'subtitle': 'สายด่วนเกี่ยวกับการเดินทางและการจราจร',
        'icon': Icons.directions_car,
        'color': const Color(0xFF2878C8),
      },
      {
        'title': 'อุบัติเหตุ-เหตุฉุกเฉิน',
        'subtitle': 'แจ้งเหตุฉุกเฉินและขอความช่วยเหลือ',
        'icon': Icons.emergency,
        'color': const Color(0xFFE34D4D),
      },
      {
        'title': 'ธนาคาร',
        'subtitle': 'รวมหมายเลขติดต่อธนาคารต่าง ๆ',
        'icon': Icons.account_balance,
        'color': const Color(0xFF269B79),
      },
      {
        'title': 'สาธารณูปโภค',
        'subtitle': 'ไฟฟ้า ประปา และเครือข่ายโทรศัพท์',
        'icon': Icons.electrical_services,
        'color': const Color(0xFFDB9635),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF26354A),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'ผู้จัดทำ',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutUI()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/icon/icon.png',
                  height: 125,
                  width: 125,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 12),
                const Text(
                  'สายด่วน THAILAND',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF26354A),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'รวมหมายเลขโทรศัพท์สำคัญของประเทศไทย',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'เลือกหมวดหมู่ที่ต้องการ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...List.generate(categories.length, (index) {
            final item = categories[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                elevation: 2,
                color: Colors.white,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  leading: CircleAvatar(
                    radius: 27,
                    backgroundColor: item['color'] as Color,
                    child: Icon(
                      item['icon'] as IconData,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  title: Text(
                    item['title'] as String,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(item['subtitle'] as String),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _navigate(context, index + 1),
                ),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF26354A),
        unselectedItemColor: Colors.grey,
        onTap: (index) => _navigate(context, index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าหลัก'),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'เดินทาง',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'ฉุกเฉิน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.electrical_services),
            label: 'สาธารณูปโภค',
          ),
        ],
      ),
    );
  }
}
