import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';


class GlassCard2 extends StatefulWidget {
  final String title;
  final String description;

  const GlassCard2({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<GlassCard2> createState() => _GlassCard2State();
}

class _GlassCard2State extends State<GlassCard2> with SingleTickerProviderStateMixin {
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
            
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.1),
                border: Border.all(
                  color: _animation.value ?? Colors.deepPurpleAccent,
                  width: 2.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: (_animation.value ?? Colors.deepPurpleAccent).withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   
                      Text(
                        softWrap: true,
                        widget.title,
                        style:  GoogleFonts.poppins(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.white,
                                  ),
                        
                        
                      


                      ).animate(delay: (100).ms).fadeIn(duration: 600.ms),
                      
                      SizedBox(height: 15,),
                       Text(
                        softWrap: true,
                        widget.description,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.white,
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















class GlassCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;

  const GlassCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> with SingleTickerProviderStateMixin {
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
                    color: (_animation.value ?? Colors.deepPurpleAccent).withOpacity(0.5),
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
                    children: [
                      Icon(widget.icon, size: 64, color: Colors.deepPurpleAccent),
                      const SizedBox(height: 16),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white70
                              : Colors.black87,
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
