import 'package:flutter/material.dart';

class AnimatedAppbar extends StatefulWidget {
  const AnimatedAppbar({super.key});

  @override
  State<AnimatedAppbar> createState() => _AnimatedAppbarState();
}

class _AnimatedAppbarState extends State<AnimatedAppbar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
                image: const DecorationImage(
                  image: AssetImage("assets/images/ccclogo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          SlideTransition(
            position: _slideAnimation,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "CLOUD COMPUTING CELL",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Think  |  Develop  |  Deploy",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
