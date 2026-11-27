import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/cake_shop.dart';

class CakeShopDetailUI extends StatelessWidget {
  final CakeShop shop;

  const CakeShopDetailUI({
    super.key,
    required this.shop,
  });

  Future<void> _openLink(String value) async {
    final uri = Uri.parse(value);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Future<void> _callShop() async {
    final uri = Uri(scheme: 'tel', path: shop.phone);
    await launchUrl(uri);
  }

  Widget _section(String title, String emoji, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title $emoji',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color(0xFF29232D),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            content,
            style: const TextStyle(
              fontSize: 15,
              height: 1.55,
              color: Color(0xFF403A43),
            ),
          ),
        ],
      ),
    );
  }

  Widget _linkRow({
    required IconData icon,
    required Color color,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF29232D),
                ),
              ),
            ),
            const Icon(
              Icons.link,
              size: 23,
              color: Color(0xFF514A55),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final location = LatLng(shop.latitude, shop.longitude);

    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(26, 26, 26, 30),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                shop.image1,
                width: 150,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    shop.image2,
                    height: 105,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    shop.image3,
                    height: 105,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          _section('ชื่อร้าน', '🏬', shop.name),
          _section('เวลาเปิด', '⏰', shop.openCloseTime),
          _section('รายละเอียดของร้าน', '🍵', shop.description),
          _section('ที่อยู่ของร้าน', '📍', shop.address),
          Center(
            child: ElevatedButton.icon(
              onPressed: _callShop,
              icon: const Icon(Icons.call, size: 19),
              label: Text(
                shop.phone,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                shape: const StadiumBorder(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          _linkRow(
            icon: Icons.language,
            color: const Color(0xFFFFB300),
            text: shop.website,
            onTap: () => _openLink(shop.website),
          ),
          _linkRow(
            icon: Icons.facebook,
            color: const Color(0xFF4285F4),
            text: shop.facebook,
            onTap: () => _openLink(shop.facebook),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 230,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: location,
                  initialZoom: 15,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.flutter_cake_shop_project',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: location,
                        width: 45,
                        height: 45,
                        child: const Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 42,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            '© OpenStreetMap contributors',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
