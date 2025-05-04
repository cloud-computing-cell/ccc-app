import 'package:ccc_app/components/background%20Animation/bganimation.dart';
import 'package:ccc_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/ccclogo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            "CLOUD COMPUTING CELL",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    _showThinkAnimation(context), // 👈 New
                                child: Text(
                                  "Think",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              Text("  |  ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              Text("Develop",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              Text("  |  ",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              Text("Deploy",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // 🔵 Cloud Animation with Tappable Icons
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 350,
                        height: 350,
                        child: Lottie.asset("assets/cloud.json"),
                      ),

                      // Figma
                      Positioned(
                        left: 50,
                        top: 150,
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                          onTap: () => _showTechInfo(
                            context,
                            "Figma",
                            "Figma is a cloud-based UI/UX design tool used for real-time collaboration.",
                            "assets/images/figma.png",
                          ),
                          child: Container(color: Colors.transparent),
                        ),
                      ),

                      // Flutter
                      Positioned(
                        left: 120,
                        top: 90,
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                          onTap: () => _showTechInfo(
                            context,
                            "Flutter",
                            "Flutter is an open-source UI toolkit by Google for building apps from a single codebase.",
                            "assets/images/cloud.png",
                          ),
                          child: Container(color: Colors.transparent),
                        ),
                      ),

                      // AWS
                      Positioned(
                        left: 200,
                        top: 160,
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                          onTap: () => _showTechInfo(
                            context,
                            "AWS",
                            "AWS (Amazon Web Services) is a cloud platform offering storage, compute and other services.",
                            "assets/images/aws.png",
                          ),
                          child: Container(color: Colors.transparent),
                        ),
                      ),

                      // HTML
                      Positioned(
                        left: 80,
                        top: 230,
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                          onTap: () => _showTechInfo(
                            context,
                            "HTML",
                            "HTML is the standard markup language used to create web pages.",
                            "assets/images/html.png",
                          ),
                          child: Container(color: Colors.transparent),
                        ),
                      ),

                      // JavaScript
                      Positioned(
                        left: 180,
                        top: 240,
                        width: 40,
                        height: 40,
                        child: GestureDetector(
                          onTap: () => _showTechInfo(
                            context,
                            "JavaScript",
                            "JavaScript is a language used to create interactive behavior on websites.",
                            "assets/images/js.png",
                          ),
                          child: Container(color: Colors.transparent),
                        ),
                      ),
                    ],
                  ),
                ),

                // 🌐 About Us
                Padding(
                  padding: const EdgeInsets.only(left: 40, bottom: 8, top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "About Us",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(156, 164, 171, 1),
                        decoration: TextDecoration.underline,
                        decorationColor: Color.fromRGBO(156, 164, 171, 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      child: Column(
                        children: [
                          Text(
                            "Cloud Computing Cell has been a part of Ajay Kumar Garg Engineering College since February 2016.",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "The members are exposed to the latest Cloud Technologies that enable them to be market ready thereby increasing their opportunities in placements and research. It provides a platform to the students to compute, manage and deploy the cloud and related services.",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "The Cell is coordinated by Dr. J. K. Seth, Ms. Anupama Sharma and Dr. Parneet Kaur, faculty members, IT department.",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30),
                Text(
                  "FACULTY COORDINATORS",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 100),

                // Faculty 1
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 85, bottom: 20, left: 20, right: 20),
                          child: Column(
                            children: [
                              Text(
                                "Mr. Santosh Sharma",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(60, 0, 255, 1)),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Santosh Mishra, Assistant Professor in IT department. having 15 years of teaching and 3 years of industry experience as Java software developer...",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -70,
                        left: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 70,
                          child: Image.asset("assets/images/santoshsir.png",
                              fit: BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 100),

                // Faculty 2
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 85, bottom: 20, left: 20, right: 20),
                          child: Column(
                            children: [
                              Text(
                                "Dr. Shikha Agarwal",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromRGBO(60, 0, 255, 1)),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Sikha Agarwal, Assistant Professor in IT department. having 15 years of teaching and 3 years of industry experience as Java software developer...",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -70,
                        left: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 70,
                          child: Image.asset("assets/images/santoshsir.png",
                              fit: BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "OUR VISION",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                _buildVisionCard(
                  svg: "assets/images/think.svg",
                  text:
                      "We think creatively and strategically to design websites and Apps...",
                ),
                SizedBox(height: 40),
                _buildVisionCard(
                  svg: "assets/images/develop.svg",
                  text:
                      "Development is the foundation of creating dynamic web and mobile applications...",
                ),
                SizedBox(height: 40),
                _buildVisionCard(
                  svg: "assets/images/deploy.svg",
                  text:
                      "We think creatively and strategically to design websites and Apps...",
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showThinkAnimation(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: 250,
          height: 250,
          child: Lottie.asset('assets/think.json'),
        ),
      ),
    );
  }

  void _showTechInfo(
      BuildContext context, String title, String description, String imagePath) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, height: 100),
            SizedBox(height: 10),
            Text(description),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  Widget _buildVisionCard({required String svg, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: Color.fromRGBO(73, 78, 168, 1), width: 2.5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 10),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -40,
            left: 0,
            right: 0,
            child: ClipOval(
              child: SizedBox(
                height: 100,
                width: 100,
                child: SvgPicture.asset(svg),
              ),
            ),
          )
        ],
      ),
    );
  }
}
