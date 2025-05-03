import 'package:ccc_app/components/background%20Animation/bganimation.dart';
import 'package:ccc_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  
  @override
  Widget build(BuildContext context) {
    double widthh = MediaQuery.of(context).size.width ;
    return Center(
      child: Container(
        width: widthh *0.36,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Profile Image
            ClipOval(
              child: Image.asset(
                'assets/images/raghav.png', // Replace with your local image
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            
            // Title
            const Text(
              'Android Developer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 4),
            const Text(
              'Raghavjasdk sajdasd fsd ds f s Aggarwal',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D1C39),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // Icons row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(FontAwesomeIcons.github, size: 20),
                SizedBox(width: 16),
                Icon(FontAwesomeIcons.linkedinIn, size: 20),
                SizedBox(width: 16),
                Icon(FontAwesomeIcons.instagram, size: 20),
              ],
            ),

            const SizedBox(height: 8),
            // Bottom border style
            Container(
              margin: const EdgeInsets.only(top: 12),
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xFF25DED4),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
