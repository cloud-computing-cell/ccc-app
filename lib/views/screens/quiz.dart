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
      
    );
  }
}
/*
import 'package:ccc_app/components/background%20Animation/bganimation.dart';
import 'package:ccc_app/constants/colors.dart';
import 'package:ccc_app/services/apiservices/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  late Future team;
  String selectedYear = "4th";

  @override
  void initState() {
    super.initState();
    team = fetchTeamData(selectedYear);
  }

  Future fetchTeamData(String year) {
    switch (year) {
      case "4th":
        return getTeamDataForFourthYear();
      case "3rd":
        return getTeamDataForThirdYear();
      case "2nd":
        return getTeamDataForSecondYear();
      default:
        return getTeamDataForFourthYear();
    }
  }

  @override
  Widget build(BuildContext context) {
    double Widthh = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
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
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/images/team.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'OUR TEAM MEMBERS',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    '"Collaboration turns dreams into reality, achieving greatness as one."',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedYear = "4th";
                          team = fetchTeamData(selectedYear);
                        });
                      },
                      child: Text(
                        "4th Year",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: selectedYear == "4th"
                              ? Color.fromRGBO(245, 163, 10, 1)
                              : Color.fromRGBO(145, 145, 145, 1),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedYear = "3rd";
                          team = fetchTeamData(selectedYear);
                        });
                      },
                      child: Text(
                        "3rd Year",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: selectedYear == "3rd"
                              ? Color.fromRGBO(110, 69, 172, 1)
                              : Color.fromRGBO(145, 145, 145, 1),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedYear = "2nd";
                          team = fetchTeamData(selectedYear);
                        });
                      },
                      child: Text(
                        "2nd Year",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: selectedYear == "2nd"
                              ? Color.fromRGBO(102, 224, 206, 1)
                              : Color.fromRGBO(145, 145, 145, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                FutureBuilder(
                  future: team,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Stack(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: Widthh * 0.36,
                                    height: Height * 0.22,
                                    child: SvgPicture.asset(
                                        "assets/images/loader.svg"),
                                  ),
                                  SizedBox(width: 2),
                                  SizedBox(
                                    width: Widthh * 0.36,
                                    height: Height * 0.22,
                                    child: SvgPicture.asset(
                                        "assets/images/loader.svg"),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: Widthh * 0.36,
                                    height: Height * 0.22,
                                    child: SvgPicture.asset(
                                        "assets/images/loader.svg"),
                                  ),
                                  SizedBox(width: 2),
                                  SizedBox(
                                    width: Widthh * 0.36,
                                    height: Height * 0.22,
                                    child: SvgPicture.asset(
                                        "assets/images/loader.svg"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }
                    if (snapshot.hasData) {
                      var teamData = snapshot.data!;
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: teamData.length,
                        itemBuilder: (BuildContext context, int index) {
                          var member = teamData[index];
                          return Center(
                            child: Container(
                              width: Widthh * 0.36,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Container(
                                    width: Widthh * 0.36,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(FontAwesomeIcons.github,
                                                size: 20),
                                            SizedBox(width: 16),
                                            Icon(FontAwesomeIcons.linkedinIn,
                                                size: 20),
                                            SizedBox(width: 16),
                                            Icon(FontAwesomeIcons.instagram,
                                                size: 20),
                                          ],
                                        ),

                                        const SizedBox(height: 8),
                                        // Bottom border style
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 12),
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
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void openSocialMedia(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class AnimatedWaveSVGBackground extends StatefulWidget {
  final String svgAsset;

  const AnimatedWaveSVGBackground({Key? key, required this.svgAsset})
      : super(key: key);

  @override
  State<AnimatedWaveSVGBackground> createState() =>
      _AnimatedWaveSVGBackgroundState();
}

class _AnimatedWaveSVGBackgroundState extends State<AnimatedWaveSVGBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat();
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
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.transparent,
                Colors.white,
              ],
              stops: [
                (_controller.value - 0.65).clamp(0.0, 1.0),
                _controller.value,
                (_controller.value + 0.35).clamp(0.0, 1.0),
              ],
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcATop,
          child: SvgPicture.asset(
            widget.svgAsset,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
*/