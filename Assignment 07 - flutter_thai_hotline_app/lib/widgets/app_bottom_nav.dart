import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFF545F71),
      unselectedItemColor: Colors.grey,
      selectedFontSize: 11,
      unselectedFontSize: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'หน้าหลัก',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car_rounded),
          label: 'การเดินทาง',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emergency_rounded),
          label: 'ฉุกเฉิน',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_rounded),
          label: 'ธนาคาร',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.electrical_services_rounded),
          label: 'สาธารณูปโภค',
        ),
      ],
    );
  }
}
