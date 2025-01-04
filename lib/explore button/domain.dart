import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              )),
          Expanded(
              flex: 2,
              child: DomainDetails(
                selectedIndex: selectedIndex,
              )),
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
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(51, 34, 104, 1),
                    shape: BoxShape.circle,
                  ),
                  child:
                      const Icon(Icons.circle, size: 12, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          domain["title"]!,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          domain["description"]!,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
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
      ..color = Color.fromRGBO(51, 34, 104, 1)
      ..strokeWidth = 5;

    final double spacing = size.height;

    for (int i = 0; i < itemCount; i++) {
      canvas.drawLine(
        Offset(12, 0),
        Offset(12, spacing),
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

  const DomainPhoto(
      {required this.selectedIndex, required this.onPhotoTapped, super.key});

  @override
  Widget build(BuildContext context) {
    final Images = [
      SvgPicture.asset("assets/images/1.svg"),
      SvgPicture.asset("assets/images/2.svg"),
      SvgPicture.asset("assets/images/3.svg"),
      SvgPicture.asset("assets/images/4.svg"),
      SvgPicture.asset("assets/images/5.svg"),
    ];

    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(19, 20, 23, 1),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 40),
              child: Text(
                "Technical Domains",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              int nextIndex = (selectedIndex + 1) % Images.length;
              onPhotoTapped(nextIndex);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [Images[selectedIndex]],
            ),
          ),
        ],
      ),
    );
  }
}
