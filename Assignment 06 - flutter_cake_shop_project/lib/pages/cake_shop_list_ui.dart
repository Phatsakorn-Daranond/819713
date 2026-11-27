import 'package:flutter/material.dart';
import '../models/cake_shop.dart';
import 'cake_shop_detail_ui.dart';

class CakeShopListUI extends StatefulWidget {
  const CakeShopListUI({super.key});

  @override
  State<CakeShopListUI> createState() => _CakeShopListUIState();
}

class _CakeShopListUIState extends State<CakeShopListUI> {
  final PageController _pageController =
      PageController(viewportFraction: 0.86);

  void _openShop(CakeShop shop) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CakeShopDetailUI(shop: shop),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('สายด่วนกินเค้ก'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 20),
        children: [
          const SizedBox(height: 7),
          SizedBox(
            height: 190,
            child: PageView.builder(
              controller: _pageController,
              itemCount: cakeShops.length,
              itemBuilder: (context, index) {
                final shop = cakeShops[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () => _openShop(shop),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            shop.image1,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const ColoredBox(
                              color: Color(0xFFFFCDD2),
                              child: Icon(
                                Icons.cake,
                                size: 60,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              color: const Color(0xCCB71C1C),
                              child: Text(
                                shop.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 7),
          ...List.generate(cakeShops.length, (index) {
            final shop = cakeShops[index];
            return InkWell(
              onTap: () => _openShop(shop),
              child: Container(
                height: 110,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFFFCDD2),
                      width: 1,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.asset(
                        shop.thumbnail,
                        width: 100,
                        height: 72,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Container(
                          width: 100,
                          height: 72,
                          color: const Color(0xFFFFE0E0),
                          child: const Icon(Icons.cake, size: 35),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shop.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xFF29232D),
                            ),
                          ),
                          Text(
                            shop.phone,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF625B66),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      radius: 14,
                      backgroundColor: Color(0xFFE53935),
                      child: Icon(
                        Icons.info_outline,
                        size: 19,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
