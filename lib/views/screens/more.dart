import 'package:ccc_app/components/background%20Animation/bganimation.dart';
import 'package:ccc_app/services/apiservices/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class teamsectioncheck extends StatefulWidget {
  const teamsectioncheck({super.key});

  @override
  State<teamsectioncheck> createState() => _teamsectioncheckState();
}

class _teamsectioncheckState extends State<teamsectioncheck> {
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 20, 23, 1),
      body: Stack(
        children: [
          CircleRotationAnimation(),
          SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage("assets/images/team.jpg"),
                                  fit: BoxFit.cover))),
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
                                    : Color.fromRGBO(145, 145, 145, 1)),
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
                                    : Color.fromRGBO(145, 145, 145, 1)),
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
                                    : Color.fromRGBO(145, 145, 145, 1)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    FutureBuilder(
                        future: team,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Stack(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: 150,
                                          height: 197,
                                          child: SvgPicture.asset(
                                              "assets/images/loader.svg"),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          width: 150,
                                          height: 197,
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
                                          width: 150,
                                          height: 197,
                                          child: SvgPicture.asset(
                                              "assets/images/loader.svg"),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          width: 150,
                                          height: 197,
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
                            return Center(
                                child: Text("Error: ${snapshot.error}"));
                          }
                          if (snapshot.hasData) {
                            var teamData = snapshot.data!;
                            return GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 10,
                                ),
                                itemCount: teamData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var member = teamData[index];
                                  return Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 197,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              selectedYear == "4th"
                                                  ? "assets/images/4th.svg"
                                                  : selectedYear == "3rd"
                                                      ? "assets/images/card3.svg"
                                                      : "assets/images/card2.svg",
                                              fit: BoxFit.cover,
                                              height: constraints.maxHeight,
                                              width: constraints.maxWidth,
                                            ),
                                            Positioned(
                                              top: constraints.maxHeight * 0.15,
                                              child: CircleAvatar(
                                                radius:
                                                    constraints.maxWidth * 0.15,
                                                child: ClipOval(
                                                  child: Image.network(
                                                      member["profile"],
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom:
                                                  constraints.maxHeight * 0.35,
                                              child: Text(
                                                member["domain"],
                                                style: TextStyle(
                                                  fontSize:
                                                      constraints.maxWidth *
                                                          0.06,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromRGBO(
                                                      130, 130, 130, 1),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom:
                                                  constraints.maxHeight * 0.25,
                                              child: Text(
                                                member["name"],
                                                style: TextStyle(
                                                  fontSize:
                                                      constraints.maxWidth *
                                                          0.07,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromRGBO(
                                                      21, 14, 43, 1),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom:
                                                  constraints.maxHeight * 0.05,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  IconButton(
                                                    onPressed: () =>
                                                        openSocialMedia(
                                                            member["github"]),
                                                    icon: SvgPicture.asset(
                                                      "assets/images/github.svg",
                                                      height:
                                                          constraints.maxWidth *
                                                              0.08,
                                                      width:
                                                          constraints.maxWidth *
                                                              0.08,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () =>
                                                        openSocialMedia(
                                                            member["linkedin"]),
                                                    icon: SvgPicture.asset(
                                                      "assets/images/linkedin.svg",
                                                      height:
                                                          constraints.maxWidth *
                                                              0.08,
                                                      width:
                                                          constraints.maxWidth *
                                                              0.08,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () =>
                                                        openSocialMedia(member[
                                                            "instagram"]),
                                                    icon: SvgPicture.asset(
                                                      "assets/images/instagram.svg",
                                                      height:
                                                          constraints.maxWidth *
                                                              0.08,
                                                      width:
                                                          constraints.maxWidth *
                                                              0.08,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                });
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              ),
                            );
                          }
                        }),
                  ],
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
