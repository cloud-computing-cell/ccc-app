// import 'dart:ffi';

import 'package:ccc_app/background%20Animation/bganimation.dart';
import 'package:ccc_app/main_ui/team.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
     
      backgroundColor: const Color.fromRGBO(19, 20, 23, 1),
      body: Stack(
        children: [
           CircleRotationAnimation(),
          SingleChildScrollView(
            child: Column(
              
                children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/ccclogo.png"), fit: BoxFit.cover)
                            ),
                          ),SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              Text("CLOUD COMPUTING CELL", style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700),),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Think  |  Develop  |  Deploy    ", style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
            
                   Padding(
                     padding: const EdgeInsets.only(left: 110,right: 40),
                     child: Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/cimage.png"),fit: BoxFit.cover)
                      ),
                     ),
                   ),   
            
                   Padding(
                     padding: const EdgeInsets.only(left: 40,bottom: 8,top: 10),
                     child: Align(
                      alignment: Alignment.centerLeft,
                       child: Text("About Us",style: TextStyle(fontSize: 18, color: Color.fromRGBO(156, 164, 171, 1),decoration: TextDecoration.underline,
                       decorationColor: Color.fromRGBO(156, 164, 171, 1)),),
                     ),
                   ),
            
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 40),
                     child: Container(
                      width: double.infinity,
            
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow:[
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(2, 2),
                            blurRadius: 4,
            
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                        child: Column(
                          children: [
                            Text("Cloud Computing Cell has been a part of Ajay Kumar Garg Engineering College since February 2016.", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),),
                            SizedBox(height: 15,),
                            Text("The members are exposed to the latest Cloud Technologies that enable them to be market ready thereby increasing their opportunities in placements and research.It provides a platform to the students to compute, manage and deploy the cloud and related services.", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),),
                            SizedBox(height: 15,),
                            Text("The Cell is coordinated by Dr. J. K. Seth, Ms. Anupama Sharma and Dr. Parneet Kaur, faculty members, IT department.", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                     ),
                   ),
                   SizedBox(height: 30,),
                   Text("FACULTY COORDINATORS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                   SizedBox(height: 100,),
          
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
                            padding: const EdgeInsets.only(top: 85,bottom: 20,left: 20,right: 20),
                            child: Column(
                              children: [
                                Text("Mr. Santosh Sharma",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color.fromRGBO(60, 0, 255, 1)),),
                                SizedBox(height: 5,),
                                Text("Santosh Mishra, Assistant Professor in IT department. having 15 years of teaching and 3 years of industry experience as Java software developer.Gold faculty partner of Infosys. Awarded with content guru award. Was mentor of Hackathon winning team of 2019. Programming knowledge of Java, C, C++, Python and PHP.Area of my research are different meta- heuristics Optimization algorithms like PSO, MFO, GSA, GA etc.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: -70,
                          left: 0 ,
                          right: 0,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage("assets/images/ccclogo.png"),
                            
                          ),
                        )
                        
                      ],
                     ),
                   ),       
                   SizedBox(height: 100,),   
          
          
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
                            padding: const EdgeInsets.only(top: 85,bottom: 20,left: 20,right: 20),
                            child: Column(
                              children: [
                                Text("Dr. Shikha Agarwal",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color.fromRGBO(60, 0, 255, 1)),),
                                SizedBox(height: 5,),
                                Text("Sikha Agarwal, Assistant Professor in IT department. having 15 years of teaching and 3 years of industry experience as Java software developer.Gold faculty partner of Infosys. Awarded with content guru award. Was mentor of Hackathon winning team of 2019. Programming knowledge of Java, C, C++, Python and PHP.Area of my research are different meta- heuristics Optimization algorithms like PSO, MFO, GSA, GA etc.",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.black),)
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: -70,
                          left: 0 ,
                          right: 0,
                          child: CircleAvatar(
                            radius: 70,
                            backgroundImage: AssetImage("assets/images/ccclogo.png"),
                            
                          ),
                        )
                        
                      ],
                     ),
                   ),            
                   SizedBox(height: 50,),
          
                   Padding(
                     padding: const EdgeInsets.only(left: 40),
                     child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("OUR VISION", style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Colors.white),)),
                   ),
                   SizedBox(height: 40,),
          
                   Padding(
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
                                border: Border.all(color: Color.fromRGBO(73, 78, 168, 1),width: 2.5)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10,top: 40,bottom: 10),
                                child: Text("We think creatively and strategically to design websites and Apps that are visually captivating, easy to navigate, and highly functional. Our thoughtful approach ensures every aspect, from performance to scalability, aligns with delivering exceptional user experiences",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
                              ),
                              
                              
                            ),
                          ),
                        ),
                        Positioned(
                          top: -40,
                          left: 0 ,
                          right: -240,
                          child: ClipOval(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: SvgPicture.asset("assets/images/think.svg"),
                              
                            ),
                          ),
                        )
                      ],
                      
                     ),
                   ),
          
          
          
                   SizedBox(height: 40,),
          
                   Padding(
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
                                border: Border.all(color: Color.fromRGBO(73, 78, 168, 1),width: 2.5)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10,top: 40,bottom: 10),
                                child: Text("Development is the foundation  of creating dynamic web and mobile applications that power modern life. Web development focuses on building interactive and responsive websites, from user-friendly frontends using HTML, CSS, and JavaScript to robust backends with frameworks like Node.js and Django. Similarly, app development combines creativity and engineering to craft mobile solutions By Flutter, React Native, or Kotlin.",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
                              ),
                              
                              
                            ),
                          ),
                        ),
                        Positioned(
                          top: -40,
                          left: -240 ,
                          right: 0  ,
                          child: ClipOval(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: SvgPicture.asset("assets/images/develop.svg"),
                              
                            ),)
                        )
                      ],
                      
                     ),
                   ),
          
          
                   SizedBox(height: 40,),
          
                   Padding(
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
                                border: Border.all(color: Color.fromRGBO(73, 78, 168, 1),width: 2.5)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10,top: 40,bottom: 10),
                                child: Text("We think creatively and strategically to design websites and Apps that are visually captivating, easy to navigate, and highly functional. Our thoughtful approach ensures every aspect, from performance to scalability, aligns with delivering exceptional user experiences",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
                              ),
                              
                              
                              
                            ),
                          ),
                        ),
                        Positioned(
                          top: -40,
                          left: 0 ,
                          right: -240,
                          child: ClipOval(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: SvgPicture.asset("assets/images/deploy.svg"),
                              
                            ),
                          ),
                        ),
                        SizedBox(height: 80,),
                      ],
                      
                     ),
                   ),
            SizedBox(height: 80,),
                ],
            
              ),
          ),
        ],
      ),

     
    );
  }
}
