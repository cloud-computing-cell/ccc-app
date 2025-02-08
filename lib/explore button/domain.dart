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
            flex: 1,
            child: domainhead(),
          ),
          Expanded(
            flex: 8,
            child: DomainPhoto(
              selectedIndex: selectedIndex,
              onPhotoChanged: (index) {
                if (index != selectedIndex) {
                  setState(() {
                    selectedIndex = index;
                  });
                }
              },
            ),
          ),
          Expanded(
            flex: 5,
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

class DomainPhoto extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onPhotoChanged;

  const DomainPhoto(
      {required this.selectedIndex, required this.onPhotoChanged, super.key});

  @override
  _DomainPhotoState createState() => _DomainPhotoState();
}

class _DomainPhotoState extends State<DomainPhoto> {
  final CardController controller = CardController();
  final List<String> images = [
    "https://s3-alpha-sig.figma.com/img/9836/bfec/2a114ce9e4bad448e1755d3ee9022be0?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=qBO9NmKg2jb6KA7enUualI-utPhRA85SvKp9DLncBfehVf7Ukoj~qgXpl2N6uggX-sk7170SNnvq3aPjo3POJUlCuOkXfYvqba7YxTdYro8JYz2omAr01wJgnInBLssxbya43pzAgra4-yrmyaloyz8vvnGSnn8KeJxnYBQEl1nOCCQnWSWofoqaHKmhzo-1jtg23Z2BfRKwml6ktV5srGGt-Op62F4U-erN390XCoDwR3ilx2EkrtbyRVcEvzXlrEk2crhP8hAPai6bQoKiJrrU0wYdsmePfhsuOgZsOG4~8In03s13tvAjGUL-4AlNF8jglzoTJIptS8ZVGL8-Hg__",
    "https://s3-alpha-sig.figma.com/img/9836/bfec/2a114ce9e4bad448e1755d3ee9022be0?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=qBO9NmKg2jb6KA7enUualI-utPhRA85SvKp9DLncBfehVf7Ukoj~qgXpl2N6uggX-sk7170SNnvq3aPjo3POJUlCuOkXfYvqba7YxTdYro8JYz2omAr01wJgnInBLssxbya43pzAgra4-yrmyaloyz8vvnGSnn8KeJxnYBQEl1nOCCQnWSWofoqaHKmhzo-1jtg23Z2BfRKwml6ktV5srGGt-Op62F4U-erN390XCoDwR3ilx2EkrtbyRVcEvzXlrEk2crhP8hAPai6bQoKiJrrU0wYdsmePfhsuOgZsOG4~8In03s13tvAjGUL-4AlNF8jglzoTJIptS8ZVGL8-Hg__",
    "https://s3-alpha-sig.figma.com/img/9836/bfec/2a114ce9e4bad448e1755d3ee9022be0?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=qBO9NmKg2jb6KA7enUualI-utPhRA85SvKp9DLncBfehVf7Ukoj~qgXpl2N6uggX-sk7170SNnvq3aPjo3POJUlCuOkXfYvqba7YxTdYro8JYz2omAr01wJgnInBLssxbya43pzAgra4-yrmyaloyz8vvnGSnn8KeJxnYBQEl1nOCCQnWSWofoqaHKmhzo-1jtg23Z2BfRKwml6ktV5srGGt-Op62F4U-erN390XCoDwR3ilx2EkrtbyRVcEvzXlrEk2crhP8hAPai6bQoKiJrrU0wYdsmePfhsuOgZsOG4~8In03s13tvAjGUL-4AlNF8jglzoTJIptS8ZVGL8-Hg__",
    "https://s3-alpha-sig.figma.com/img/9836/bfec/2a114ce9e4bad448e1755d3ee9022be0?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=qBO9NmKg2jb6KA7enUualI-utPhRA85SvKp9DLncBfehVf7Ukoj~qgXpl2N6uggX-sk7170SNnvq3aPjo3POJUlCuOkXfYvqba7YxTdYro8JYz2omAr01wJgnInBLssxbya43pzAgra4-yrmyaloyz8vvnGSnn8KeJxnYBQEl1nOCCQnWSWofoqaHKmhzo-1jtg23Z2BfRKwml6ktV5srGGt-Op62F4U-erN390XCoDwR3ilx2EkrtbyRVcEvzXlrEk2crhP8hAPai6bQoKiJrrU0wYdsmePfhsuOgZsOG4~8In03s13tvAjGUL-4AlNF8jglzoTJIptS8ZVGL8-Hg__",
    "https://s3-alpha-sig.figma.com/img/9836/bfec/2a114ce9e4bad448e1755d3ee9022be0?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=qBO9NmKg2jb6KA7enUualI-utPhRA85SvKp9DLncBfehVf7Ukoj~qgXpl2N6uggX-sk7170SNnvq3aPjo3POJUlCuOkXfYvqba7YxTdYro8JYz2omAr01wJgnInBLssxbya43pzAgra4-yrmyaloyz8vvnGSnn8KeJxnYBQEl1nOCCQnWSWofoqaHKmhzo-1jtg23Z2BfRKwml6ktV5srGGt-Op62F4U-erN390XCoDwR3ilx2EkrtbyRVcEvzXlrEk2crhP8hAPai6bQoKiJrrU0wYdsmePfhsuOgZsOG4~8In03s13tvAjGUL-4AlNF8jglzoTJIptS8ZVGL8-Hg__",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(19, 20, 23, 1),
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child:
                Image.network(images[index % images.length], fit: BoxFit.cover),
          );
        },
        cardController: controller,
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {
          widget.onPhotoChanged((index + 1) % images.length);
        },
      ),
    );
  }
}

class domainhead extends StatelessWidget {
  const domainhead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(19, 20, 23, 1),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8,top: 8),
              child: Text(
                    "Technical Domains",
                    style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
            ),
          ],
        ));
  }
}
