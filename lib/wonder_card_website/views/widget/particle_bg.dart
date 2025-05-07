import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math';

import 'package:wonder_card_website/utils/wonder_card_colors.dart';

class ParticleBackground extends StatelessWidget {
  const ParticleBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [const AnimatedBackground(), const AnimatedParticles()],
    );
  }
}

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1Animation;
  late Animation<Color?> _color2Animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _color1Animation = ColorTween(
      begin: AppColors.primaryShade,
      end: Colors.deepPurple,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _color2Animation = ColorTween(
      begin: Colors.white,
      end: Colors.deepPurple.shade100,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(color: _color1Animation.value, child: Center());
      },
    );
  }
}

class AnimatedParticles extends StatefulWidget {
  const AnimatedParticles({super.key});

  @override
  State<AnimatedParticles> createState() => _AnimatedParticlesState();
}

class _AnimatedParticlesState extends State<AnimatedParticles> {
  final Random random = Random();
  late List<Offset> particles;

  @override
  void initState() {
    super.initState();
    particles = List.generate(
      100,
      (index) => Offset(random.nextDouble(), random.nextDouble()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomAnimationBuilder<double>(
      control: Control.loop,
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(seconds: 20),
      builder: (context, value, _) {
        return CustomPaint(
          painter: ParticlePainter(particles, value),
          child: Container(),
        );
      },
    );
  }
}

class ParticlePainter extends CustomPainter {
  final List<Offset> particles;
  final double animationValue;

  ParticlePainter(this.particles, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.3);
    for (var p in particles) {
      final position = Offset(
        p.dx * size.width,
        (p.dy + animationValue) % 1.0 * size.height,
      );
      canvas.drawCircle(position, 2.5, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
