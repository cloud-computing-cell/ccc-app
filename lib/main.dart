import 'package:ccc_app/custom_nav/customnav.dart';
import 'package:ccc_app/explore%20button/connectus.dart';
import 'package:ccc_app/main_ui/event.dart';
import 'package:ccc_app/main_ui/home.dart';
import 'package:ccc_app/main_ui/more.dart';
import 'package:ccc_app/main_ui/quiz.dart';
import 'package:ccc_app/main_ui/team.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MaterialApp(
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
  int currentindex =0;

  @override
  Widget build(BuildContext context) {
    // final nav =[
    //   Icon(Icons.home , size: 30, color: Color.fromRGBO(51, 34, 104, 1),),
    //   Icon(Icons.event , size: 30,color: Color.fromRGBO(51, 34, 104, 1),),
    //   Icon(Icons.holiday_village , size: 30,color: Color.fromRGBO(51, 34, 104, 1),),
    //   Icon(Icons.quiz_outlined , size: 30,color: Color.fromRGBO(51, 34, 104, 1),),
    //   Icon(Icons.more_vert , size: 30,color: Color.fromRGBO(51, 34, 104, 1),),

    // ];
    final screen =[
      Home(),
      MyEventPage(),
      Team(),
      Quiz(),
      
      
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