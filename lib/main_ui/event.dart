import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyEventPage extends StatefulWidget {
  const MyEventPage({super.key});

  @override
  State<MyEventPage> createState() => _MyEventPageState();
}

class _MyEventPageState extends State<MyEventPage> {
  final myitems = [
    Image.asset('assets/images/shape.png'),
    Image.asset('assets/images/shape.png'),
    Image.asset('assets/images/shape.png'),
    Image.asset('assets/images/shape.png'),
  ];
  int myCurrentIndex = 0;

  // Track expanded state for each paragraph
  List<bool> expandedList = [false, false, false, false, false];

  // Handle paragraph expansion toggle
  void toggleExpansion(int index) {
    setState(() {
      expandedList[index] = !expandedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: const Text('adhdhejd'),
        centerTitle: true,
        elevation: 3,
        backgroundColor: Colors.grey.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 200,
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

            // Adding 5 containers with paragraphs below the carousel
            for (int i = 0; i < 5; i++)
              GestureDetector(
                onTap: () => toggleExpansion(i),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'This is paragraph ${i + 1}. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      if (expandedList[i]) ...[
                        SizedBox(height: 10),  // Spacer between paragraph and images
                        Container(
                          height: 120,  // Height of the image carousel below the paragraph
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Image.asset('assets/images/shape.png', width: 100),
                              Image.asset('assets/images/shape.png', width: 100),
                              Image.asset('assets/images/shape.png', width: 100),
                              Image.asset('assets/images/shape.png', width: 100),
                            ],
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}