
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Section extends StatelessWidget {
  final String title;
  final Widget child;
  final Color color;

  const Section({
    super.key,
    required this.title,
    required this.child,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )
          ).animate(delay: (100).ms).fadeIn(duration: 600.ms),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }
}


