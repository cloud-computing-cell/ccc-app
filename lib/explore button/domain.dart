import 'package:flutter/material.dart';
import 'package:scrumlab_flutter_tindercard/scrumlab_flutter_tindercard.dart';

class Domain extends StatefulWidget {
  const Domain({super.key});

  @override
  State<Domain> createState() => _DomainState();
}

class _DomainState extends State<Domain> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: DomainPhoto(
              selectedIndex: selectedIndex,
              onPhotoTapped: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: DomainDetails(
              selectedIndex: selectedIndex,
            ),
          ),
        ],
      ),
    );
  }
}

class DomainDetails extends StatelessWidget {
  final int selectedIndex;
  const DomainDetails({required this.selectedIndex, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> domains = [
      {
        "title": "App Development",
        "description":
            "App development involves designing, building, and maintaining software applications that run on various devices, including smartphones, tabs, etc. These apps are created to fulfill specific needs, such as enabling communicate, improving productivity, or providing entertainment."
      },
      {
        "title": "Web Development",
        "description":
            "Web development is the process of creating and maintaining websites or web application that are  accessible  through the  internet. It involves coding, designing, and structuring web pages to deliver a functional and engaging user experience"
      },
      {
        "title": "Cloud Computing",
        "description":
            "Cloud computing is the delivery of computing services  —  such as storage , processing , databases, networking, and software over the internet. It enable users to access resources on-demand without needs to own physical hardware."
      },
      {
        "title": "Machine Learning",
        "description":
            "Machine Learning (ML) is a branch of artificial intelligence (AI) that focuses on developing systems capable of learning and improving from experience without being explicitly programmed."
      },
      {
        "title": "UI/UX Design",
        "description":
            "UI - (User Interface) and  UX - (User Experience) design  are  two  essential  components  of creating a digital product, such as a website or mobile app. They work together to ensure that the product is not only visually appeal but also easy and enjoyable to use."
      },
    ];

    final domain = domains[selectedIndex];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // Draws a custom vertical thread-like background
          Positioned.fill(
            child: CustomPaint(
              painter: ThreadPainter(itemCount: domains.length),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Circle Icon
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(51, 34, 104, 1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.circle, size: 12, color: Colors.white),
                ),
                const SizedBox(width: 16),
                // Title and Description
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          domain["title"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          domain["description"]!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThreadPainter extends CustomPainter {
  final int itemCount;

  ThreadPainter({required this.itemCount});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromRGBO(51, 34, 104, 1)
      ..strokeWidth = 5;

    final double spacing = size.height / itemCount;

    for (int i = 0; i < itemCount; i++) {
      canvas.drawLine(
        Offset(12, i * spacing),
        Offset(12, (i + 1) * spacing),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DomainPhoto extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onPhotoTapped;

  const DomainPhoto({
    required this.selectedIndex,
    required this.onPhotoTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final images = [
      Image.network(
        "https://s3-alpha-sig.figma.com/img/c449/3101/c3bd75023fa32b67ecc64c0048169f98?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=D2GdpEdmgvPpKhAMVrgG1e3WSlGCAMlFNfcBZOsm02I-0EnNC8JS9TTaQJ5B5f6cUChfjvXipo2~MsVcUsHhnzudWPWBXzJ4M5y~ud2YQiL~kpRcLK7dPRb5qCZ3vMbyEaVhze9KCQLsa5vpiueVw8p8huNs2DvW9Ppt9-xPd8ufa-P3R~kSXtXutikihrZOIGYEFo8T1BrJ66lwB-xOExFnkM0u-lLIgVtTlbzYT3U8FMjy4bc6m4IslsjzrUWD9g5jKxcOdx3CEnH-bnqhfhfOB7Q4yaaJKl4Qx6xf9AjiP3v9O8p8TZcM4YW3cCFBI~lQsqgQOwZuuWvDclwvng__",
        fit: BoxFit.cover,
      ),
      Image.network(
        "https://s3-alpha-sig.figma.com/img/9836/bfec/2a114ce9e4bad448e1755d3ee9022be0?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=gCx8fjQT6Hfr-ir7bhuOvs1Tv7ReV6u3W2dCn2~FTWv8eLr9OY2GJwmZgpi6QXIad7mAOETZOFSfzVuQ2x~6m4LLLROglq0138KsIB-skA3CZAigUkll9CSb7ycoW1Qmkxj0hfu2sqQBT4Zlf7w4EO2ungcsJawSTcG2qcDwPrmDTgWQA1uKHsAkhsBRNtSN2kMD-nVcsC~Ad30hZrSXPkZuMUVPipb~I44v1A4EwJqegyNkd42~CCKG4iF43pwSSCPnBlKDLrLxA8OwCz0xQl1~JVp-VQG5Ant-TkLwSB93m-S4mb~WOzZhHV0RyTRFRfMrNvHZRJIsY78nGaJ2oA__",
        fit: BoxFit.cover,
      ),
      Image.network(
        "https://s3-alpha-sig.figma.com/img/d8ad/f5e6/419890217b37826177955c0bedfe9e8a?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=mk-XbMBi1sdZeHhYrx42BtcsPxC4~OZh4g2xYS1q5DWPcpGR0LjMz2Zj~rpV4GM~qtiRhywXGWNbiJ~OuEEhbAN7yJJQ7VYg-pPQRFpt9EfDLMAeJDSs31khpVuABACvcSEIuyA9O2jbYXwxFQzYapSqwbYYNPYqOXdYthTvwiK5RehX-aABuNPys7ULfwb9jkMPEQInYXOP1iYnytasxB0RFykxgTRIMYUuurFHXaOFyhvx-hvG3lpoSFMG0CpgzR75IGLHH9EeAhhadPHx7gF8QJJSZzkq-K3Fx11kYnMh9Zp~wjK4le7hdf4MBRGbqPN0EKuw-m6b810447abyA__",
        fit: BoxFit.cover,
      ),
      Image.network(
        "https://s3-alpha-sig.figma.com/img/8a8d/3cac/6a6d0843ff74243b990a0c45162d887b?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=BgSsUfmOb1GMHd8dcUXXbL5djNDooHLChMWrZSuJdUBx13NRi3RNDs0pmYAWNRahJEiKjDNnSSiCbWU0kQoJTqA18TuqJ2Zz2rMc2lyy1GhdSUzBz1OoqM2Qgr-7hCkDZ41bd5XWdMzZELNEX3~4I8ZvYmCkUzGYFp6md27XrUKAYk6n5YehsQypjr37bYZO~VSG2mvr413xLzo5CJaIFkprbKkRCGyKzC428HqooWur2WwoxmddN7wzE--e7D4mYZ7cvHQ15jQ5UaBHtOorrMPl5G488Z5QClIY8137w16bJmiA5CSX-b6kTEBC3c89YujS1tcE8ChYmK1FLZXVIQ__",
        fit: BoxFit.cover,
      ),
      Image.network(
        "https://s3-alpha-sig.figma.com/img/d592/7ed6/5ab14d8a733d474385f49c5e72a701b2?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZQYSqoUXiZ7vReoCjvP5P1xbLVziWC1Ou-OSrC5678ic5Gyl17aA5cE3TZudM2KsfP~IsOEMKtJFQeYu~K7b6tTnO-HqmTHOX7O1YNqTeHCBh1X9WFoVqaOX25A7K~m9ezhOKOJhaydP9YS9~XfAHYp~~dlKf~s-zJSsEx96mlLJeCL~Pk4O74sNdGs7Jwe8tXePDyOyYzZjpC-hNYAW8VqmN9fdPJApslOv7ORWQgxgPXtvFj6ZPEqb1ufX-o5ArKxq464aNUVLuoh8jaDbJbnd7enQIz3o3yAtsXh~oBkHqGIoT6eigwi-s3I5v6ieMrPqWPAZANPPMEqG3qwcUA__",
        fit: BoxFit.cover,
      ),
    ];

    final height = MediaQuery.of(context).size.height;
    final CardController controller = CardController();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 20, 23, 1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: const Text(
              "Technical Domains",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: height / 2.5,
            child: TinderSwapCard(
              swipeUp: true,
              swipeDown: true,
              orientation: AmassOrientation.bottom,
              totalNum: 100000,
              stackNum: 3,
              swipeEdge: 4.0,
              maxHeight: MediaQuery.sizeOf(context).width * 0.9,
              minHeight: MediaQuery.sizeOf(context).width * 0.8,
              maxWidth: MediaQuery.sizeOf(context).width * 0.9,
              minWidth: MediaQuery.sizeOf(context).width * 0.8,
              cardBuilder: (context, index) {
                int imageIndex = index % images.length;
                return GestureDetector(
                  onTap: () => onPhotoTapped(imageIndex),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: images[imageIndex],
                  ),
                );
              },
              cardController: controller,
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {},
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {},
            ),
          ),
        ],
      ),
    );
  }
}
