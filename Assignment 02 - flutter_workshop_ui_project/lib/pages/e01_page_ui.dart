import 'e02_page_ui.dart';

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class E01PageUI extends StatelessWidget {
  const E01PageUI({super.key});

  static const Color orange = Color(0xFFF69515);
  static const Color yellow = Color(0xFFFFC52A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          const designWidth = 360.0;
          const designHeight = 800.0;

          final scale = math.min(
            constraints.maxWidth / designWidth,
            constraints.maxHeight / designHeight,
          );

          final leftOffset = (constraints.maxWidth - designWidth * scale) / 2;
          final topOffset = (constraints.maxHeight - designHeight * scale) / 2;

          return Stack(
            children: [
              Positioned(
                left: leftOffset + 20 * scale,
                top: topOffset + 30 * scale,
                width: 320 * scale,
                height: 460 * scale,
                child: Image.asset(
                  'assets/images/berry_juice.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: leftOffset + 123 * scale,
                top: topOffset + 462 * scale,
                width: 120 * scale,
                height: 13 * scale,
                child: SvgPicture.asset(
                  'assets/icons/ellipse_11.svg',
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: leftOffset,
                top: topOffset + 490 * scale,
                width: 360 * scale,
                child: Text(
                  'BERRY JUICE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36 * scale,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.2,
                  ),
                ),
              ),
              Positioned(
                left: leftOffset + 20 * scale,
                top: topOffset + 559 * scale,
                width: 320 * scale,
                child: Text(
                  'A Moments of healthy sip\n'
                  'The best vitamin for your health',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15 * scale,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 1.4,
                  ),
                ),
              ),
              Positioned(
                left: leftOffset + 40 * scale,
                top: topOffset + 690 * scale,
                width: 280 * scale,
                height: 50 * scale,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [yellow, orange]),
                    borderRadius: BorderRadius.circular(20 * scale),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20 * scale),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const E02PageUI(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20 * scale),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Explore Now',
                              style: TextStyle(
                                fontSize: 20 * scale,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icons/arrow_right.svg',
                              width: 30 * scale,
                              height: 30 * scale,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
