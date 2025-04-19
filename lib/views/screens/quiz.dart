import 'package:ccc_app/components/background%20Animation/bganimation.dart';
import 'package:ccc_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          CircleRotationAnimation(),
          SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset("assets/images/quizz.svg")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
