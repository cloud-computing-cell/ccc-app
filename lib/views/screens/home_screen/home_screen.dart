import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ccc_app/components/background%20Animation/bganimation.dart';
import 'package:ccc_app/constants/colors.dart';
import 'package:ccc_app/controllers/event_controller.dart';
import 'package:ccc_app/views/explore_button/registration_screen/register_screen.dart';
import 'package:ccc_app/views/screens/home_screen/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final EventController controller = Get.put(EventController());

  final myitems = [
    Image.asset("assets/images/event1.png"),
    Image.asset("assets/images/event2.png"),
    Image.asset("assets/images/event3.png"),
    Image.asset("assets/images/event4.png"),
    Image.asset("assets/images/event5.png"),
  ];
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
              child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      EdgeInsets.only(top: 20, right: 10, left: 10, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/nimbus2.jpg',
                          fit: BoxFit.contain,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));
                          },
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white, size: 28),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ));
        },
      );
    });
  }

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
                Appbar(),

                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayInterval: const Duration(seconds: 2),
                    onPageChanged: (index, reason) {
                      controller.myCurrentIndex.value = index;
                    },
                  ),
                  items: myitems,
                ),

                // Indicator
                Obx(() => buildUndicator(controller.myCurrentIndex.value)),

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
                          decorationColor: Color.fromRGBO(156, 164, 171, 1)),
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
                        ]),
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
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "The members are exposed to the latest Cloud Technologies that enable them to be market ready thereby increasing their opportunities in placements and research.It provides a platform to the students to compute, manage and deploy the cloud and related services.",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "The Cell is coordinated by Dr. J. K. Seth, Ms. Anupama Sharma and Dr. Parneet Kaur, faculty members, IT department.",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
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
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
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
                                border: Border.all(
                                    color: Color.fromRGBO(73, 78, 168, 1),
                                    width: 2.5)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 40, bottom: 10),
                              child: Text(
                                "We think creatively and strategically to design websites and Apps that are visually captivating, easy to navigate, and highly functional. Our thoughtful approach ensures every aspect, from performance to scalability, aligns with delivering exceptional user experiences",
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
                        right: -240,
                        child: ClipOval(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: SvgPicture.asset("assets/images/think.svg"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
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
                                border: Border.all(
                                    color: Color.fromRGBO(73, 78, 168, 1),
                                    width: 2.5)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 40, bottom: 10),
                              child: Text(
                                "Development is the foundation  of creating dynamic web and mobile applications that power modern life. Web development focuses on building interactive and responsive websites, from user-friendly frontends using HTML, CSS, and JavaScript to robust backends with frameworks like Node.js and Django. Similarly, app development combines creativity and engineering to craft mobile solutions By Flutter, React Native, or Kotlin.",
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
                          left: -240,
                          right: 0,
                          child: ClipOval(
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child:
                                  SvgPicture.asset("assets/images/develop.svg"),
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
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
                                border: Border.all(
                                    color: Color.fromRGBO(73, 78, 168, 1),
                                    width: 2.5)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 40, bottom: 10),
                              child: Text(
                                "We think creatively and strategically to design websites and Apps that are visually captivating, easy to navigate, and highly functional. Our thoughtful approach ensures every aspect, from performance to scalability, aligns with delivering exceptional user experiences",
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
                        right: -240,
                        child: ClipOval(
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: SvgPicture.asset("assets/images/deploy.svg"),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUndicator(int currentIndex) => AnimatedSmoothIndicator(
        activeIndex: currentIndex,
        count: myitems.length,
        effect: const ScrollingDotsEffect(
          activeDotColor: Color.fromRGBO(123, 97, 255, 1),
          activeDotScale: 1.5,
          dotHeight: 8,
          dotWidth: 8,
        ),
      );
}
