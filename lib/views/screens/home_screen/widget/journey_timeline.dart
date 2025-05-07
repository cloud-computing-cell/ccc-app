import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class JourneyTimeline extends StatelessWidget {
  final List<Map<String, String>> journeyEvents = [
    {
      "year": "2016",
      "event": "Cloud Computing Cell was founded at AKGEC."
    },
    {
      "year": "2018",
      "event": "Organized first major cloud workshop in collaboration with AWS."
    },
    {
      "year": "2020",
      "event": "Launched cloud-based student projects during the pandemic."
    },
    {
      "year": "2022",
      "event": "Hosted inter-college cloud competetion 'Nimbus'."
    },
    {
      "year": "2024",
      "event": "Developed CCC app and revamped online presence."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: journeyEvents.asMap().entries.map((entry) {
          final index = entry.key;
          final data = entry.value;
          return TimelineTile(
            alignment: TimelineAlign.start,
            isFirst: index == 0,
            isLast: index == journeyEvents.length - 1,
            indicatorStyle: IndicatorStyle(
              width: 20,
              color: Colors.deepPurpleAccent,
              padding: EdgeInsets.all(6),
            ),
            beforeLineStyle: LineStyle(
              color: Colors.deepPurple,
              thickness: 3,
            ),
            endChild: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Colors.black.withOpacity(0.2),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    title: Text(
                      data['year']!,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    subtitle: Text(
                      data['event']!,
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
