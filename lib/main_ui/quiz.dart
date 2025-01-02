import 'package:carousel_slider/carousel_slider.dart';
import 'package:ccc_app/background%20Animation/bganimation.dart';
import 'package:ccc_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 20, 23, 1),
      body: Stack(
        children: [
          CircleRotationAnimation(),
          SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset("assets/images/quiz.svg")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
