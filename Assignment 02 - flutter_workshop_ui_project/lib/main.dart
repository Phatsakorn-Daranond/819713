
import 'package:flutter/material.dart';
import 'pages/e01_page_ui.dart';

void main() {
  runApp(const BerryJuiceApp());
}

class BerryJuiceApp extends StatelessWidget {
  const BerryJuiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orange ส้ม',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const E01PageUI(),
    );
  }
}
