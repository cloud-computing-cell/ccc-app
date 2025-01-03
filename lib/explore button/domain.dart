import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Domain extends StatefulWidget {
  const Domain({super.key});

  @override
  State<Domain> createState() => _DomainState();
}

class _DomainState extends State<Domain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(flex: 3, child: DomainPhoto()),
          Expanded(flex: 2, child: const DomainDetails()),
        ],
      ),
    );
  }
}

class DomainDetails extends StatelessWidget {
  const DomainDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> domains = [
      {
        "title": "App Development",
        "description": "Designing and building interactive mobile applications for iOS and Android."
      },
      {
        "title": "Web Development",
        "description": "Creating responsive and dynamic websites and web applications."
      },
      {
        "title": "Cloud Computing",
        "description": "Cloud computing is the delivery of computing services  —  such as storage , processing , databases, networking, and software over the internet. It enable users to access resources on-demand without needs to own physical hardware."
      },
      {
        "title": "Machine Learning",
        "description": "Implementing predictive models using data-driven algorithms."
      },
      {
        "title": "Data Science",
        "description": "Analyzing and visualizing data to derive actionable insights."
      },
      {
        "title": "Cybersecurity",
        "description": "Ensuring the security of systems, networks, and data."
      },
      {
        "title": "UI/UX Design",
        "description": "Enhancing user experiences through intuitive and attractive interfaces."
      },
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // Thread Background
          Positioned.fill(
            child: CustomPaint(
              painter: ThreadPainter(itemCount: domains.length),
            ),
          ),
          // Domain List
          ListView.builder(
            itemCount: domains.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Circular Icon
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(51, 34, 104, 1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.circle, size: 12, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    // Text Information
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                domains[index]["title"]!,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: Colors.black
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                domains[index]["description"]!,
                                style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
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

    final double spacing = size.height / (itemCount + 1);

    for (int i = 0; i < itemCount; i++) {
      final y = spacing * (i + 1);
      canvas.drawLine(
        Offset(12, y),
        Offset(12, y + spacing),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DomainPhoto extends StatelessWidget {
  const DomainPhoto({super.key});

  @override
  Widget build(BuildContext context) {
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
          Stack(
            children: [
              Transform.rotate(
                angle: -0.12,
                child: SvgPicture.asset("assets/images/1.svg"),
              ),
              Transform.rotate(
                angle: -0.1,
                child: SvgPicture.asset("assets/images/2.svg"),
              ),
              Transform.rotate(
                angle: -0.08,
                child: SvgPicture.asset("assets/images/3.svg"),
              ),
              Transform.rotate(
                angle: -0.06,
                child: SvgPicture.asset("assets/images/4.svg"),
              ),
              Transform.rotate(
                angle: -0.04,
                child: SvgPicture.asset("assets/images/5.svg"),
              ),
              Transform.rotate(
                angle: -0.02,
                child: SvgPicture.asset("assets/images/6.svg"),
              ),
              Transform.rotate(
                angle: 0,
                child: SvgPicture.asset("assets/images/7.svg"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

