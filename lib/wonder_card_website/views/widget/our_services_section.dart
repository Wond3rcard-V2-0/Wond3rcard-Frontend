import 'package:flutter/material.dart';
import 'package:wonder_card_website/wonder_card_website/views/glass_card.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/section_widget.dart';

class OurServicesSection extends StatelessWidget {
  const OurServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Section(
      title: 'Our Services',
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child:
            isMobile
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('images/card-bg.png'),
                    const SizedBox(height: 20),
                    const GlassCard2(
                      title: 'Elevate your cards',
                      description:
                          'Gone are the days of exchanging stale business cards that end up forgotten in a drawer. Experience the power of Wond3rCard, the digital solution designed to revolutionize your networking efforts. Create and share your digital business card with ease. Say goodbye to outdated business cards and hello to interactive and dynamic digital networking!',
                    ),
                  ],
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Image.asset('images/card-bg.png')),
                    const SizedBox(width: 20),
                    const Expanded(
                      child: GlassCard2(
                        title: 'Elevate your cards',
                        description:
                            'Gone are the days of exchanging stale business cards that end up forgotten in a drawer. Experience the power of Wond3rCard, the digital solution designed to revolutionize your networking efforts. Create and share your digital business card with ease. Say goodbye to outdated business cards and hello to interactive and dynamic digital networking!',
                      ),
                    ),
                  ],
                ),
      ),
      color: Colors.transparent,
    );
  }
}
