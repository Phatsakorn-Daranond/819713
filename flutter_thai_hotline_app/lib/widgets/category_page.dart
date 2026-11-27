import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/hotline_data.dart';
import '../pages/about_ui.dart';
import 'app_bottom_nav.dart';

class CategoryPage extends StatelessWidget {
  final HotlineCategory category;
  final int currentIndex;
  final ValueChanged<int> onNavTap;

  const CategoryPage({
    super.key,
    required this.category,
    required this.currentIndex,
    required this.onNavTap,
  });

  Future<void> _callNumber(BuildContext context, String phone) async {
    final uri = Uri(scheme: 'tel', path: phone);

    try {
      final launched = await launchUrl(uri);
      if (!launched && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ไม่สามารถโทรออกได้ กรุณาลองอีกครั้ง')),
        );
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('เกิดข้อผิดพลาดในการโทรออก')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final centerImage =
        'assets/images/${category.folder}/${category.prefix}_0.png';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 69,
        backgroundColor: const Color(0xFFD9D9D9),
        foregroundColor: const Color(0xFF1B1B1B),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'สายด่วน THAILAND',
          style: GoogleFonts.kanit(fontSize: 21, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            tooltip: 'ผู้จัดทำ',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutUI()),
              );
            },
            icon: const Icon(Icons.error_outline),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 14),
            SizedBox(
              height: 62,
              child: Center(
                child: Text(
                  'สายด่วน\n${category.title}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    fontSize: 22,
                    height: 1.15,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1B1B1B),
                  ),
                ),
              ),
            ),

            // รูปประจำหมวดหมู่ ไม่มีกรอบหรือพื้นหลัง
            SizedBox(
              width: 230,
              height: 175,
              child: Image.asset(
                centerImage,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => const Icon(
                  Icons.image_not_supported_outlined,
                  size: 50,
                  color: Color(0xFF999999),
                ),
              ),
            ),

            const SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                itemCount: category.items.length,
                separatorBuilder: (_, _) => const SizedBox(height: 13),
                itemBuilder: (context, index) {
                  final item = category.items[index];

                  return Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFD0D0D0)),
                      borderRadius: BorderRadius.circular(11),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 6),
                      leading: SizedBox(
                        width: 78,
                        height: 82,
                        child: Image.asset(
                          item.imageAsset,
                          fit: BoxFit.contain,
                          errorBuilder: (_, _, _) => Icon(
                            item.icon,
                            size: 42,
                            color: const Color(0xFF1B1B1B),
                          ),
                        ),
                      ),
                      title: Text(
                        item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.kanit(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1B1B1B),
                        ),
                      ),
                      subtitle: Text(
                        item.phone,
                        style: GoogleFonts.kanit(
                          fontSize: 14,
                          color: const Color(0xFF1B1B1B),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => _callNumber(context, item.phone),
                        icon: const Icon(
                          Icons.phone_outlined,
                          size: 25,
                          color: Color(0xFF1B1B1B),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: currentIndex,
        onTap: onNavTap,
      ),
    );
  }
}
