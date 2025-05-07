import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wonder_card_website/utils/wonder_card_colors.dart';
import 'package:wonder_card_website/utils/wonder_card_strings.dart';
import 'dart:ui';

import 'package:wonder_card_website/wonder_card_website/views/widget/section_widget.dart';


final themeNotifier = ValueNotifier(ThemeMode.light);

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Section(
      title: '',
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.purple[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: isMobile ? 0 : 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: isMobile ? 20 : 50),
                    child: Text(
                      'Digital',
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 24 : 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ).animate(delay: (100).ms).fadeIn(duration: 600.ms),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: isMobile ? 20 : 50),
                    child: Text(
                      'Business Card',
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 24 : 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                    ).animate(delay: (100).ms).fadeIn(duration: 600.ms),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: isMobile ? 20 : 50),
                    child: Text(
                      'With Wond3rCard',
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 24 : 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                    ).animate(delay: (100).ms).fadeIn(duration: 600.ms),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: isMobile ? 20 : 50),
                    child: Text(
                      'Create and share your digital business card with ease. Say goodbye to outdated business cards and hello to interactive and dynamic digital networking!',
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 14 : 17,
                        color: Colors.black,
                      ),
                    ).animate(delay: (200).ms).fadeIn(duration: 600.ms),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        context.go(RouteString.signup);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryShade,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text('Get Started',
                            style:
                                TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!isMobile)
              Expanded(
                flex: 1,
                child: Image.asset(
                  'images/phone-hand-mockup.png',
                  fit: BoxFit.contain,
                ),
              ),
            if (isMobile)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'images/phone-hand-mockup.png',
                  fit: BoxFit.contain,
                  height: 200,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
