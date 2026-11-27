import 'package:flutter/material.dart';

import '../data/hotline_data.dart';
import '../widgets/category_page.dart';
import 'home_ui.dart';
import 'travel_ui.dart';
import 'bank_ui.dart';
import 'pub_ui.dart';

class EmgUI extends StatelessWidget {
  const EmgUI({super.key});

  void _navigate(BuildContext context, int index) {
    final pages = [
      const HomeUI(),
      const TravelUI(),
      const EmgUI(),
      const BankUI(),
      const PubUI(),
    ];
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) => CategoryPage(
    category: emergencyCategory,
    currentIndex: 2,
    onNavTap: (index) => _navigate(context, index),
  );
}
