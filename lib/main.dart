import 'package:ccc_app/custom_nav/customnav.dart';
import 'package:ccc_app/explore%20button/connectus.dart';
import 'package:ccc_app/explore%20button/domain.dart';
import 'package:ccc_app/explore%20button/project.dart';
import 'package:ccc_app/explore%20button/register.dart';
import 'package:ccc_app/main_ui/event.dart';
import 'package:ccc_app/main_ui/home.dart';
import 'package:ccc_app/main_ui/more.dart';
import 'package:ccc_app/main_ui/quiz.dart';
import 'package:ccc_app/main_ui/team.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    final screen = [
      Home(),
      MyEventPage(),
      Team(),
      Quiz(),
      Project(),
      Connectus(),
      Register(),
      Domain(),
    ];
   
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromRGBO(19, 20, 23, 1),
        body: screen[currentindex],
        bottomNavigationBar: Customnav(
          onItemSelected: (index) {
            setState(() {
              currentindex = index;
            });
          },
        ),
      ),
    );
  }
}