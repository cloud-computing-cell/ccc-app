import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  final List<String> imgList = [
    'assets/images/1.svg',
    'assets/images/2.svg',
    'assets/images/3.svg',
    'assets/images/4.svg',
    'assets/images/5.svg',
    'assets/images/6.svg',
    'assets/images/7.svg',
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 20, 23, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "As Our Aim",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
                SizedBox(height: 5,),
            Align(
                alignment: Alignment.center,
                child: Text(
                  "THINK || DEVELOP || DEPLOY",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 5),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Our team is dedicated to designing and implementing innovative projects that address real-life challenges.By integrating technology and creativity, we aim to create practical solutions that improve daily life, enhance efficiency, and contribute to a sustainable future.",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(139, 139, 139, 1),
                          fontWeight: FontWeight.w600),
                          textAlign: TextAlign.justify,
                    )),
                    Container(
                      width: 130,
                      height: 130,
                      child: SvgPicture.asset("assets/images/projectbg.svg"),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
             CarouselSlider(
              
              
              options: CarouselOptions(
             
                enlargeCenterPage: true,
                
                aspectRatio: 1.0,
                viewportFraction: 0.8,
                scrollPhysics: BouncingScrollPhysics(),
              ),
              items: imgList.map((item) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset(item),
              )).toList(),
             ),
        
        
          ],
        ),
      ),
    );
  }
}