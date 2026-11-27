import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_ui.dart';
import 'auth_widgets.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                width: 375,
                height: 812,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/img.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      left: 58,
                      top: 107,
                      width: 253,
                      height: 253,
                      child: Image(
                        image: AssetImage('assets/images/img_dev1.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Positioned(
                      left: 149,
                      top: 433,
                      width: 70,
                      height: 70,
                      child: Image(
                        image: AssetImage('assets/images/img_dev2.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      left: 91,
                      top: 519,
                      child: Row(
                        children: [
                          Text(
                            'SAU',
                            style: GoogleFonts.urbanist(
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                              color: const Color(0xFF1E232C),
                              height: 1.3,
                              letterSpacing: -0.3,
                            ),
                          ),
                          Text(
                            'Developer',
                            style: GoogleFonts.urbanist(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFF1E232C),
                              height: 1.3,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 22,
                      top: 590,
                      width: 331,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginUI(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E232C),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: GoogleFonts.urbanist(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 22,
                      top: 661,
                      width: 331,
                      height: 57,
                      child: OutlinedButton(
                        onPressed: () => sauMessage(context, 'Register'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF1E232C),
                          side: const BorderSide(
                            color: Color(0xFF1E232C),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Register',
                          style: GoogleFonts.urbanist(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 750,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            'Created by SAU Dev Team',
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF35C2C1),
                            ),
                          ),
                          Text(
                            'มหาวิทยาลัยเอเชียอาคเนย์',
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF35C2C1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
