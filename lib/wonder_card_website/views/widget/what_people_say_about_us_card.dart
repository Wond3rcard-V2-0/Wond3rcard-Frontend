import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';
import 'dart:ui';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:marquee/marquee.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/faq.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/get_a_demo_section.dart';
import 'package:wonder_card_website/wonder_card_website/views/widget/section_widget.dart';

class WhatPeopleSayAboutUsCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const WhatPeopleSayAboutUsCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<WhatPeopleSayAboutUsCard> createState() =>
      _WhatPeopleSayAboutUsCardState();
}

class _WhatPeopleSayAboutUsCardState extends State<WhatPeopleSayAboutUsCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = ColorTween(
      begin: Colors.deepPurpleAccent,
      end: Colors.blueAccent,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedCard(
        direction: AnimatedCardDirection.top,
        initDelay: const Duration(milliseconds: 0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.1),
                border: Border.all(
                  color: _animation.value ?? Colors.deepPurpleAccent,
                  width: 2.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: (_animation.value ?? Colors.deepPurpleAccent)
                        .withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Icon(
                            index < 4 ? Icons.star : Icons.star_border,
                            size: 24,
                            color: Colors.amber,
                          );
                        }),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white70
                                    : Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "- ${widget.title}",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white54
                                    : Colors.grey,
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
    );
  }
}

class Testimonial {
  final String title;
  final String description;
  final IconData icon;

  Testimonial({
    required this.title,
    required this.description,
    required this.icon,
  });
}

final List<Testimonial> testimonials = [
  Testimonial(
    title: 'John Doe',
    description: 'Amazing service! Highly recommend to anyone.',
    icon: Icons.person,
  ),
  Testimonial(
    title: 'Jane Smith',
    description: 'Top-notch quality and great customer support.',
    icon: Icons.person_outline,
  ),
  Testimonial(
    title: 'Alex Johnson',
    description: 'Exceeded my expectations in every way!',
    icon: Icons.thumb_up,
  ),
  Testimonial(
    title: 'Emily Davis',
    description: 'Beautiful designs and smooth collaboration.',
    icon: Icons.design_services,
  ),
];

class WhatPeopleSayAboutUsWidget extends StatelessWidget {
  const WhatPeopleSayAboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;

    return Section(
      title: '',
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'What People Say About Us',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ).animate(delay: (100).ms).fadeIn(duration: 600.ms),
          SizedBox(height: 25),
          SizedBox(
            height: 30,
            child: Marquee(
              text:
                  '⭐️ Trusted by thousands ⭐️ Innovative Solutions ⭐️ Customer Satisfaction Guaranteed ⭐️',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.amber,
              ),
              scrollAxis: Axis.horizontal,
              blankSpace: 50.0,
              velocity: 50.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration: const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration: const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 370,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: testimonials.length,
                itemBuilder: (context, index) {
                  final testimonial = testimonials[index];
                  return Container(
                    width: isDesktop ? 300 : 250,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.1),
                      border: Border.all(
                        color: Colors.deepPurpleAccent,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurpleAccent.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(testimonial.icon, size: 48, color: Colors.purple),
                        const SizedBox(height: 16),
                        Text(
                          testimonial.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: Marquee(
                            text: testimonial.description,
                            scrollAxis: Axis.vertical,
                            blankSpace: 40.0,
                            velocity: 30.0,
                            startPadding: 0,
                            accelerationDuration: const Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration: const Duration(
                              milliseconds: 500,
                            ),
                            decelerationCurve: Curves.easeOut,
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white70
                                      : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 30),
          FAQSection(),
          SizedBox(height: 40),
          GetADemoSection(),
        ],
      ),
    );
  }
}
