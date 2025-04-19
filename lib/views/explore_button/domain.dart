import 'package:ccc_app/constants/colors.dart';
import 'package:ccc_app/controllers/domain_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrumlab_flutter_tindercard/scrumlab_flutter_tindercard.dart';

class Domain extends StatelessWidget {
  const Domain({super.key});

  @override
  Widget build(BuildContext context) {
    final DomainController controller = Get.put(DomainController());

    return Scaffold(
      body: Column(
        children: [
          const Expanded(flex: 1, child: DomainHead()),
          Expanded(flex: 8, child: DomainPhoto()),
          Expanded(
            flex: 5,
            child: Obx(() => DomainDetails(
                  selectedIndex: controller.selectedIndex.value,
                )),
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
            "App development involves designing, building, and maintaining software applications that run on various devices, including smartphones, tabs, etc."
      },
      {
        "title": "Web Development",
        "description":
            "Web development is the process of creating and maintaining websites or web applications that are accessible through the internet."
      },
      {
        "title": "Cloud Computing",
        "description":
            "Cloud computing is the delivery of computing services—such as storage, processing, databases, networking, and software over the internet."
      },
      {
        "title": "Machine Learning",
        "description":
            "Machine Learning (ML) is a branch of artificial intelligence (AI) that focuses on developing systems capable of learning and improving from experience."
      },
      {
        "title": "UI/UX Design",
        "description":
            "UI (User Interface) and UX (User Experience) design work together to ensure that a digital product is both visually appealing and easy to use."
      },
    ];

    final domain = domains[selectedIndex % domains.length];

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
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(51, 34, 104, 1),
                    shape: BoxShape.circle,
                  ),
                  child:
                      const Icon(Icons.circle, size: 12, color: Colors.white),
                ),
                const SizedBox(width: 16),
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
  final List<String> images = [
    "assets/images/app.png",
    "assets/images/web.png",
    "assets/images/cloud.png",
    "assets/images/ML.png",
    "assets/images/ui.png",
  ];

  final CardController controller = CardController();

  DomainPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    final DomainController domainController = Get.find();

    return Container(
      color: AppColors.primaryColor,
      height: MediaQuery.of(context).size.height / 2.5,
      child: TinderSwapCard(
        swipeUp: true,
        swipeDown: true,
        totalNum: 1000000,
        stackNum: 4,
        swipeEdge: 4.0,
        maxHeight: MediaQuery.sizeOf(context).width * 0.9,
        minHeight: MediaQuery.sizeOf(context).width * 0.8,
        maxWidth: MediaQuery.sizeOf(context).width * 0.9,
        minWidth: MediaQuery.sizeOf(context).width * 0.8,
        cardBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset(
              images[index % images.length],
              fit: BoxFit.cover,
            ),
          );
        },
        cardController: controller,
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          domainController.updateIndex((index + 1) % images.length);
        },
      ),
    );
  }
}

class DomainHead extends StatelessWidget {
  const DomainHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: const [
          SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Technical Domains",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
