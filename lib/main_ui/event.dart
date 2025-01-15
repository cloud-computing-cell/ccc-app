import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    SvgPicture.asset("assets/images/devclash.svg"),
    SvgPicture.asset("assets/images/devclash.svg"),
    SvgPicture.asset("assets/images/devclash.svg"),
    SvgPicture.asset("assets/images/devclash.svg"),
  ];

  int myCurrentIndex = 0;

  final List<String> paragraphTexts = [
    'This is paragraph 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.',
    'This is paragraph 2. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.',
    'This is paragraph 3. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
    'This is paragraph 4. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
    'This is paragraph 5. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?',
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
              GestureDetector(
                onTap: () => toggleExpansion(i),
                child: ClipPath(
                  clipper: MiddleIndentClipper(expandedList[i]),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          paragraphTexts[i],
                          // maxLines: expandedList[i] ? 100 : 3,
                          maxLines: expandedList[i] ? null : 3,
                          // overflow: TextOverflow.ellipsis,
                          overflow: expandedList[i] ? TextOverflow.visible : TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
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
            SizedBox(height: 85,),
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
