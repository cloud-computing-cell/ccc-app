import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scrumlab_flutter_tindercard/scrumlab_flutter_tindercard.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyEventPage extends StatefulWidget {
  const MyEventPage({super.key});

  @override
  State<MyEventPage> createState() => _MyEventPageState();
}

class _MyEventPageState extends State<MyEventPage> {
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

  int myCurrentIndex = 0;

  final List<String> paragraphTexts = [
    'To Unleash your creativity, solve challenges, and make your mark in the world of development!”⭐Step into the world of innovation with DevClash , organized by Cloud Computing Cell. A blend of knowledge ,creativity and excitement is what awaits you. Whether you are passionate about app development or web designing, this is your chance to shine and learn like never before.Get ready to test your skills in two thrilling rounds. First, the Elimination Round will challenge your knowledge, selecting the top 7 app and web teams each that will qualify for the Development Round, where you’ll craft app or web pages based on provided designs.🌟 Grand Prizes: Cash prizes for the top teams in both app and web category!⭐PRIZE POOL: Rs. 6000⭐This isnt just a competition; its an experience of growth and innovation. Let your talent connect with like-minded tech enthusiasts and make this even',
    'To Unleash your creativity, solve challenges, and make your mark in the world of development!”⭐Step into the world of innovation with DevClash , organized by Cloud Computing Cell. A blend of knowledge ,creativity and excitement is what awaits you. Whether you are passionate about app development or web designing, this is your chance to shine and learn like never before.Get ready to test your skills in two thrilling rounds. First, the Elimination Round will challenge your knowledge, selecting the top 7 app and web teams each that will qualify for the Development Round, where you’ll craft app or web pages based on provided designs.🌟 Grand Prizes: Cash prizes for the top teams in both app and web category!⭐PRIZE POOL: Rs. 6000⭐This isnt just a competition; its an experience of growth and innovation. Let your talent connect with like-minded tech enthusiasts and make this even',
    'To Unleash your creativity, solve challenges, and make your mark in the world of development!”⭐Step into the world of innovation with DevClash , organized by Cloud Computing Cell. A blend of knowledge ,creativity and excitement is what awaits you. Whether you are passionate about app development or web designing, this is your chance to shine and learn like never before.Get ready to test your skills in two thrilling rounds. First, the Elimination Round will challenge your knowledge, selecting the top 7 app and web teams each that will qualify for the Development Round, where you’ll craft app or web pages based on provided designs.🌟 Grand Prizes: Cash prizes for the top teams in both app and web category!⭐PRIZE POOL: Rs. 6000⭐This isnt just a competition; its an experience of growth and innovation. Let your talent connect with like-minded tech enthusiasts and make this even',
    'To Unleash your creativity, solve challenges, and make your mark in the world of development!”⭐Step into the world of innovation with DevClash , organized by Cloud Computing Cell. A blend of knowledge ,creativity and excitement is what awaits you. Whether you are passionate about app development or web designing, this is your chance to shine and learn like never before.Get ready to test your skills in two thrilling rounds. First, the Elimination Round will challenge your knowledge, selecting the top 7 app and web teams each that will qualify for the Development Round, where you’ll craft app or web pages based on provided designs.🌟 Grand Prizes: Cash prizes for the top teams in both app and web category!⭐PRIZE POOL: Rs. 6000⭐This isnt just a competition; its an experience of growth and innovation. Let your talent connect with like-minded tech enthusiasts and make this even',
    'To Unleash your creativity, solve challenges, and make your mark in the world of development!”⭐Step into the world of innovation with DevClash , organized by Cloud Computing Cell. A blend of knowledge ,creativity and excitement is what awaits you. Whether you are passionate about app development or web designing, this is your chance to shine and learn like never before.Get ready to test your skills in two thrilling rounds. First, the Elimination Round will challenge your knowledge, selecting the top 7 app and web teams each that will qualify for the Development Round, where you’ll craft app or web pages based on provided designs.🌟 Grand Prizes: Cash prizes for the top teams in both app and web category!⭐PRIZE POOL: Rs. 6000⭐This isnt just a competition; its an experience of growth and innovation. Let your talent connect with like-minded tech enthusiasts and make this even',
  ];
  final colorEvent = [
    Color.fromRGBO(130, 120, 215, 1),
    Color.fromRGBO(140, 226, 113, 1),
    Color.fromRGBO(120, 201, 215, 1),
    Color.fromRGBO(215, 120, 185, 1),
    Color.fromRGBO(226, 133, 46, 1),
  ];

  final List<List<Widget>> paragraphImages = [
    [
      SvgPicture.asset("assets/images/devclash.svg", width: 100),
      SvgPicture.asset('assets/images/2.svg', width: 100),
    ],
    [
      SvgPicture.asset('assets/images/1.svg', width: 100),
      SvgPicture.asset('assets/images/2.svg', width: 100),
    ],
    [
      SvgPicture.asset('assets/images/2.svg', width: 100),
      SvgPicture.asset('assets/images/2.svg', width: 100),
      SvgPicture.asset('assets/images/2.svg', width: 100),
      SvgPicture.asset('assets/images/2.svg', width: 100),
      SvgPicture.asset('assets/images/2.svg', width: 100),
      SvgPicture.asset('assets/images/2.svg', width: 100),
      SvgPicture.asset('assets/images/2.svg', width: 100),
    ],
    [
      SvgPicture.asset('assets/images/1.svg', width: 100),
    ],
    [
      SvgPicture.asset('assets/images/1.svg', width: 100),
    ],
  ];

  List<bool> expandedList = [false, false, false, false, false];

  void toggleExpansion(int index) {
    setState(() {
      expandedList[index] = !expandedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    CardController controller;
    final double widthsize = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 20, 23, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
                  setState(() {
                    myCurrentIndex = index;
                  });
                },
              ),
              items: myitems,
            ),
            // SizedBox(
            // height: height / 2.5,
            // child: TinderSwapCard(
            //   swipeUp: true,
            //   swipeDown: true,
            //   orientation: AmassOrientation.bottom,
            //   totalNum: 10000,
            //   stackNum: 3,
            //   swipeEdge: 4.0,
            //   maxHeight: MediaQuery.sizeOf(context).height * 0.9,
            //   minHeight: MediaQuery.sizeOf(context).height * 0.8,
            //   maxWidth: MediaQuery.sizeOf(context).width * 0.9,
            //   minWidth: MediaQuery.sizeOf(context).width * 0.8,
            //   cardBuilder: (context, index) {
            //     int imageIndex = index % myitems.length;
            //     return Card(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10)),
            //     clipBehavior: Clip.antiAliasWithSaveLayer,
            //     child: myitems[imageIndex],
            //   );
            //   },
            //   cardController: controller = CardController(),
            //   swipeUpdateCallback:
            //       (DragUpdateDetails details, Alignment align) {
            //     if (align.x < 0) {
            //     } else if (align.x > 0) {}
            //   },
            //   swipeCompleteCallback:
            //       (CardSwipeOrientation orientation, int index) {},
            // ),
            // ),
            buildUndicator(),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
            for (int i = 0; i < paragraphTexts.length; i++) ...[
              Transform.translate(
                offset: Offset(-widthsize * 0.22, 13),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.27,
                  height: 20,
                  child: events[i],
                ),
              ),
              GestureDetector(
                onTap: () => toggleExpansion(i),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ClipPath(
                    clipper: MiddleIndentClipper(expandedList[i]),
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
                            // maxLines: expandedList[i] ? 100 : 3,
                            maxLines: expandedList[i] ? null : 5,
                            // overflow: TextOverflow.ellipsis,
                            overflow: expandedList[i]
                                ? TextOverflow.visible
                                : TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: i == 2 || i == 1
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (expandedList[i]) ...[
                const SizedBox(height: 10),
                Container(
                  height: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: paragraphImages[i],
                  ),
                ),
              ],
            ],
            SizedBox(
              height: 85,
            ),
          ],
        ),
      ),
    );
  }

  buildUndicator() => AnimatedSmoothIndicator(
        activeIndex: myCurrentIndex,
        count: myitems.length,
        effect: ScrollingDotsEffect(
          activeDotColor: Color.fromRGBO(123, 97, 255, 1),
          activeDotScale: 1.5,
          dotHeight: 8,
          dotWidth: 8,
        ),
      );
}

class MiddleIndentClipper extends CustomClipper<Path> {
  final bool isExpanded;

  MiddleIndentClipper(this.isExpanded);

  @override
  Path getClip(Size size) {
    final Path path = Path();
    // double depth = isExpanded ? size.height * 0.2 : size.height * 0.2;

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
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
