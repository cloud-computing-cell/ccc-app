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
                    fontSize: 22,
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
                      fontSize: 14,
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
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      AnimatedWaveSVGBackground(
                                        svgAsset: selectedYear == "4th"
                                            ? "assets/images/4th.svg"
                                            : selectedYear == "3rd"
                                                ? "assets/images/card3.svg"
                                                : "assets/images/card2.svg",
                                      ),
                                      Positioned(
                                        top: constraints.maxHeight * 0.22,
                                        child: CircleAvatar(
                                          radius: constraints.maxWidth * 0.22,
                                          backgroundImage:
                                              NetworkImage(member["profile"]),
                                          backgroundColor: Colors.grey[200],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: constraints.maxHeight * 0.20,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              member["domain"],
                                              style: TextStyle(
                                                fontSize:
                                                    constraints.maxWidth * 0.06,
                                                fontWeight: FontWeight.w600,
                                                color: Color.fromRGBO(
                                                    130, 130, 130, 1),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              member["name"],
                                              style: TextStyle(
                                                fontSize:
                                                    constraints.maxWidth * 0.07,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    21, 14, 43, 1),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: constraints.maxHeight * 0.09,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                openSocialMedia(
                                                    member['github']);
                                              },
                                              child: Icon(
                                                  FontAwesomeIcons.github,
                                                  size: 18),
                                            ),
                                            SizedBox(width: 16),
                                            GestureDetector(
                                              onTap: () {
                                                openSocialMedia(
                                                    member['linkedin']);
                                              },
                                              child: Icon(
                                                  FontAwesomeIcons.linkedinIn,
                                                  size: 18),
                                            ),
                                            SizedBox(width: 16),
                                            GestureDetector(
                                              onTap: () {
                                                openSocialMedia(
                                                    member['instagram']);
                                              },
                                              child: Icon(
                                                  FontAwesomeIcons.instagram,
                                                  size: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
