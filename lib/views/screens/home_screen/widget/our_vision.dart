import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OurVision extends StatelessWidget {
  const OurVision({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "OUR VISION",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 40),
        VisionCard(
          title: "Think",
          description:
              "We think creatively and strategically to design websites and apps that are visually captivating, easy to navigate, and highly functional. Our thoughtful approach ensures every aspect, from performance to scalability, aligns with delivering exceptional user experiences.",
          imagePath: "assets/images/think.svg",
          isImageRight: true,
        ),
        const SizedBox(height: 40),
        VisionCard(
          title: "Develop",
          description:
              "Development is the foundation of creating dynamic web and mobile applications that power modern life. From frontends to robust backends, we use tools like Flutter, React Native, and Django to bring ideas to life.",
          imagePath: "assets/images/develop.svg",
          isImageRight: false,
        ),
        const SizedBox(height: 40),
        VisionCard(
          title: "Deploy",
          description:
              "We ensure our apps and systems are deployed efficiently and perform reliably. From CI/CD pipelines to scalable cloud hosting, we focus on delivering seamless end-user experiences.",
          imagePath: "assets/images/deploy.svg",
          isImageRight: true,
        ),
      ],
    );
  }
}

class VisionCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final bool isImageRight;

  const VisionCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    this.isImageRight = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10,
                  offset: Offset(0, 6),
                ),
              ],
              border: Border.all(
                color: Colors.deepPurpleAccent,
                width: 2.5,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -40,
            left: isImageRight ? null : 0,
            right: isImageRight ? 0 : null,
            child: ClipOval(
              child: Container(
                width: 90,
                height: 90,
                padding: const EdgeInsets.all(8),
                color: Colors.white.withOpacity(0.1),
                child: SvgPicture.asset(imagePath),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
