import 'package:ccc_app/constants/colors.dart';
import 'package:ccc_app/controllers/event_controller.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyEventPage extends StatelessWidget {
  MyEventPage({super.key});
  final EventController controller = Get.put(EventController());

  final myitems = [
    Image.asset("assets/images/event1.png"),
    Image.asset("assets/images/event2.png"),
    Image.asset("assets/images/event3.png"),
    Image.asset("assets/images/event4.png"),
    Image.asset("assets/images/event5.png"),
  ];

  final events = [
    SvgPicture.asset("assets/images/devclash.svg"),
    SvgPicture.asset("assets/images/spocc.svg"),
    SvgPicture.asset("assets/images/hackoverflow.svg"),
    SvgPicture.asset("assets/images/NIMBUS.svg"),
    SvgPicture.asset("assets/images/GRAPHICON.svg"),
  ];

  final List<String> paragraphTexts = List.generate(
    5,
    (_) =>
        'To Unleash your creativity, solve challenges, and make your mark in the world of development!”⭐Step into the world of innovation with DevClash, organized by Cloud Computing Cell. A blend of knowledge, creativity, and excitement awaits you. Whether you are passionate about app development or web designing, this is your chance to shine. Get ready to test your skills in two thrilling rounds. 🌟 Grand Prizes: Cash prizes!⭐PRIZE POOL: Rs. 6000⭐ This isn’t just a competition; it’s an experience of growth and innovation.',
  );

  final colorEvent = [
    // Color.fromRGBO(130, 120, 215, 1),
    // Color.fromRGBO(140, 226, 113, 1),
    Color.fromRGBO(0, 0, 0, 0.5),
    Color.fromRGBO(0, 0, 0, 0.5),
    Color.fromRGBO(0, 0, 0, 0.5),
    Color.fromRGBO(0, 0, 0, 0.5),
    Color.fromRGBO(0, 0, 0, 0.5),

  ];

  final List<List<Widget>> paragraphImages = [
    [
      Image.asset("assets/images/devclash1.jpg", width: 100),
      Image.asset("assets/images/devclash1.jpg", width: 100),
      Image.asset("assets/images/devclash1.jpg", width: 100),
      Image.asset("assets/images/devclash1.jpg", width: 100),
    ],
    [
      SvgPicture.asset('assets/images/spocc.svg', width: 100),
      SvgPicture.asset('assets/images/spocc.svg', width: 100),
    ],
    List.generate(
        7, (_) => SvgPicture.asset('assets/images/2.svg', width: 100)),
    [
      Image.asset('assets/images/mem1.jpg', width: 100),
      Image.asset('assets/images/mem2.jpg', width: 100),
      Image.asset('assets/images/mem1.jpg', width: 100),
      Image.asset('assets/images/mem2.jpg', width: 100),
    ],
    [
      Image.asset('assets/images/mem1.jpg', width: 100),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final double widthsize = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'OUR POPULAR EVENTS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Carousel
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 200,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayInterval: const Duration(seconds: 2),
                onPageChanged: (index, reason) {
                  controller.myCurrentIndex.value = index;
                },
              ),
              items: myitems,
            ),

            // Indicator
            Obx(() => buildUndicator(controller.myCurrentIndex.value)),

            // Activities title
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Activities",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(156, 164, 171, 1),
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromRGBO(156, 164, 171, 1),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Event List
            Obx(() => Column(
                  children: List.generate(paragraphTexts.length, (i) {
                    final isExpanded = controller.expandedList[i];
                    return Column(
                      children: [
                        Transform.translate(
                          offset: Offset(-widthsize * 0.22, 13),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.27,
                            height: 20,
                            child: events[i],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.toggleExpansion(i),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: ClipPath(
                              clipper: MiddleIndentClipper(isExpanded),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                padding: const EdgeInsets.all(10),
                                color: colorEvent[i],
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      paragraphTexts[i],
                                      maxLines: isExpanded ? null : 5,
                                      overflow: isExpanded
                                          ? TextOverflow.visible
                                          : TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (isExpanded) ...[
                          const SizedBox(height: 10),
                          Container(
                            height: 120,
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (int j = 0;
                                    j < paragraphImages[i].length;
                                    j++) ...[
                                  paragraphImages[i][j],
                                  if (j != paragraphImages[i].length - 1)
                                    const SizedBox(width: 12),
                                ]
                              ],
                            ),
                          ),
                        ],
                      ],
                    );
                  }),
                )),
            const SizedBox(height: 85),
          ],
        ),
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

// Custom Clipper
class MiddleIndentClipper extends CustomClipper<Path> {
  final bool isExpanded;

  MiddleIndentClipper(this.isExpanded);

  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.1, 0);
    path.lineTo(size.width * 0.15, 20);
    path.lineTo(size.width * 0.42, 20);
    path.lineTo(size.width * 0.47, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
