import 'package:flutter/material.dart';

class CircleRotationAnimation extends StatefulWidget {
  @override
  _CircleRotationAnimationState createState() =>
      _CircleRotationAnimationState();
}

class _CircleRotationAnimationState extends State<CircleRotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _horizontalMotion;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    );

    _horizontalMotion = Tween<double>(begin: -210.0, end: 210.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _opacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0).chain(
          CurveTween(curve: Curves.easeInOut),
        ),
        weight: 25,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0).chain(
          CurveTween(curve: Curves.easeInOut),
        ),
        weight: 25,
      ),
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _horizontalMotion,
      builder: (context, child) {
        double width = MediaQuery.of(context).size.width;

        return Stack(
          children: [
            Positioned(
              top: 50,
              right: width / 2 - 230,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Container(
                  width: 625,
                  height: 595,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(254, 254, 254, 0.1),
                        Color.fromRGBO(148, 128, 128, 0),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.32, 0.79],
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              left: (width / 2) - 150 + _horizontalMotion.value,
              top: 400,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.2),
                        Color.fromRGBO(32, 21, 66, 0.2),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.05, 1.0],
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
