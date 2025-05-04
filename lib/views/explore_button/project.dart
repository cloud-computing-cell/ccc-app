import 'package:ccc_app/controllers/project_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ccc_app/constants/colors.dart';

class Project extends StatelessWidget {
  final ProjectController controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: Colors.white));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "As Our Aim",
                  style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 5),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "THINK || DEVELOP || DEPLOY",
                  style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 5),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Our team is dedicated to designing and implementing innovative projects that address real-life challenges. By integrating technology and creativity, we aim to create practical solutions that improve daily life, enhance efficiency, and contribute to a sustainable future.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(139, 139, 139, 1),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      height: 130,
                      child: SvgPicture.asset("assets/images/projectbg.svg"),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  aspectRatio: 1.0,
                  viewportFraction: 0.8,
                  scrollPhysics: const BouncingScrollPhysics(),
                ),
                items: controller.projects.map((project) {
                  return TouristGuideCard(
                    projectName: project.projectName,
                    madeBy: project.madeBy,
                    toolsUsed: project.toolsUsed,
                    githubLink: project.githubLink,
                  );
                }).toList(),
              ),

              SizedBox(height: 100,)
            ],
          ),
        );
      }),
    );
  }
}


class ProjectData {
  final String projectName;
  final String madeBy;
  final List<String> toolsUsed;
  final String githubLink;

  ProjectData({
    required this.projectName,
    required this.madeBy,
    required this.toolsUsed,
    required this.githubLink,
  });

  factory ProjectData.fromJson(Map<String, dynamic> json) {
    return ProjectData(
      projectName: json['projectName'],
      madeBy: json['madeBy'],
      toolsUsed: List<String>.from(json['toolsUsed']),
      githubLink: json['githublink'],
    );
  }
}

class TouristGuideCard extends StatelessWidget {
  final String projectName;
  final String madeBy;
  final List<String> toolsUsed;
  final String githubLink;

  const TouristGuideCard({
    required this.projectName,
    required this.madeBy,
    required this.toolsUsed,
    required this.githubLink,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ClipPath(
                  clipper: TopRightArcClipper(),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.greenAccent.shade200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Text(
                    projectName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text(
                'By:- ',
                style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Text(
                  madeBy,
                  style: const TextStyle(color: Colors.white70, height: 1.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...toolsUsed.map(
            (tech) => Row(
              children: [
                const Text("• ", style: TextStyle(color: Colors.white, fontSize: 20)),
                Expanded(
                  child: Text(
                    tech,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => launchURL(githubLink),
            child: const Text(
              'View on GitHub',
              style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  void launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class TopRightArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.arcToPoint(
      Offset(0, size.height),
      radius: Radius.circular(100),
      clockwise: false,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}