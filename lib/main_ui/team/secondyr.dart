// TODO Implement this library.
// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondYearScreen extends StatelessWidget {
  final String year;

  SecondYearScreen({required this.year});

  @override
  Widget build(BuildContext context) {
    // Define a color for each year
    Color yearColor;
    if (year == '4th Year') {
      yearColor = Colors.yellow; // 4th Year will be yellow
    } else if (year == '3rd Year') {
      yearColor = Colors.green; // 3rd Year will be green
    } else {
      yearColor = Colors.orange; // 2nd Year will be orange
    }
    return Scaffold(
        backgroundColor: Colors.black, // Set the background color to black
        body: SingleChildScrollView(
          child: Column(
            children: [
              // First image and heading
              Column(
                children: [
                  // First image with reduced distance from top (using SVG)
                  SvgPicture.asset(
                    'assets/images/whitebg.svg', // Correct path to the main image (SVG)
                    width: 500,
                    height: 500,
                  ),
                  SizedBox(height: 10), // Reduced space between the image and the heading
                  Text(
                    'OUR TEAM MEMBERS',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  
                  SizedBox(height: 20), // Space after the second text
                  // Second heading and description with Padding
                  Padding(
                    padding: EdgeInsets.all(10), // Padding around the description text
                    child: Text(
                      'Collabration turns dream into reality,achieving greatness as one.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontStyle: FontStyle.italic, // Italic style for a more informal feel
                      ),
                      textAlign: TextAlign.center, // Centering the description
                    ),
                  ),
                  SizedBox(height: 10), // Reduced space between the heading and the next text
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute the texts evenly
                  children: [
                    // Year Text for 4th Year
                    Text(
                      '4th Year',
                      style: TextStyle(
                        fontSize: 20,
                        color: year == '4th Year' ? Colors.yellow : Colors.white,
                        decoration: year == '4th Year' ? TextDecoration.underline : TextDecoration.none, // Underline if selected
                      ),
                    ),
                    // Year Text for 3rd Year
                    Text(
                      '3rd Year',
                      style: TextStyle(
                        fontSize: 20,
                        color: year == '3rd Year' ? Colors.green : Colors.white,
                        decoration: year == '3rd Year' ? TextDecoration.underline : TextDecoration.none, // Underline if selected
                      ),
                    ),
                    // Year Text for 2nd Year
                    Text(
                      '2nd Year',
                      style: TextStyle(
                        fontSize: 20,
                        color: year == '2nd Year' ? Colors.orange : Colors.white,
                        decoration: year == '2nd Year' ? TextDecoration.underline : TextDecoration.none, // Underline if selected

// Text color for better contrast
                        ),
                      ),
                  ],
                      ),
                    ],
                  ),


                  SizedBox(height: 20),
                   // Space after the description
                  // Team member list
                  Text(
                    '(Batch 2022-26)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Create rows of team members with CircleAvatar and images
                  Column(
                    children: [
                      // First row of team members (2 images per row)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the row content
                        children: [
                          // Team member 1 with CircleAvatar inside the image
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                width: 150,
                                height: 197,
                                child: SvgPicture.asset(
                                  'assets/images/whitebg.svg', // Background image (SVG)
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              // CircleAvatar for team member 1 (Shifted upwards)
                              Positioned(
                                top: 40, // Shifted slightly upwards
                                child: CircleAvatar(
                                  radius: 35, // Circle size
                                  backgroundImage: AssetImage('assets/images/sir.jpg'), // Path to profile image
                                ),
                              ),
                              // Text below the CircleAvatar
                              Positioned(
                                bottom: 50, // Position text just below the CircleAvatar
                                child: Column(
                                  children: [
                                    Text(
                                      'John Doe', // Name of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'Developer', // Role of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Row to place three small images horizontally (including github.svg)
                              Positioned(
                                bottom: 30, // Adjusted to be just below the "Developer" text
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // Make the Row take minimum space
                                  children: [
                                    // First small image (GitHub icon)
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your small image (GitHub)
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Second small image
                                    SvgPicture.asset(
                                      'assets/images/linkedin.svg', // Path to your second small image
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Third small image
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your third small image
                                      width: 10,
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10), // Space between avatars
                          // Team member 2 with CircleAvatar inside the image
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                width: 150,
                                height: 197,
                                child: SvgPicture.asset(
                                  'assets/images/whitebg.svg', // Background image (SVG)
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              // CircleAvatar for team member 2 (Shifted upwards)
                              Positioned(
                                top: 40, // Shifted slightly upwards
                                child: CircleAvatar(
                                  radius: 35, // Circle size
                                  backgroundImage: AssetImage('assets/images/sir.jpg'), // Path to profile image
                                ),
                              ),
                              // Text below the CircleAvatar
                              Positioned(
                                bottom: 50, // Position text just below the CircleAvatar
                                child: Column(
                                  children: [
                                    Text(
                                      'Jane Smith', // Name of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'Designer', // Role of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Row to place three small images horizontally (including github.svg)
                              Positioned(
                                bottom: 30, // Adjusted to be just below the "Designer" text
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // Make the Row take minimum space
                                  children: [
                                    // First small image (GitHub icon)
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your small image (GitHub)
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Second small image
                                    SvgPicture.asset(
                                      'assets/images/linkedin.svg', // Path to your second small image
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Third small image
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your third small image
                                      width: 10,
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Second row of team members (2 images per row)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the row content
                        children: [
                          // Team member 3 with CircleAvatar inside the image
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                width: 150,
                                height: 197,
                                child: SvgPicture.asset(
                                  'assets/images/whitebg.svg', // Background image (SVG)
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              // CircleAvatar for team member 3 (Shifted upwards)
                              Positioned(
                                top: 40, // Shifted slightly upwards
                                child: CircleAvatar(
                                  radius: 35, // Circle size
                                  backgroundImage: AssetImage('assets/images/sir.jpg'), // Path to profile image
                                ),
                              ),
                              // Text below the CircleAvatar
                              Positioned(
                                bottom: 50, // Position text just below the CircleAvatar
                                child: Column(
                                  children: [
                                    Text(
                                      'Mike Johnson', // Name of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'Manager', // Role of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Row to place three small images horizontally (including github.svg)
                              Positioned(
                                bottom: 30, // Adjusted to be just below the "Manager" text
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // Make the Row take minimum space
                                  children: [
                                    // First small image (GitHub icon)
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your small image (GitHub)
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Second small image
                                    SvgPicture.asset(
                                      'assets/images/linkedin.svg', // Path to your second small image
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Third small image
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your third small image
                                      width: 10,
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          // Team member 4 with CircleAvatar inside the image
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                width: 150,
                                height: 197,
                                child: SvgPicture.asset(
                                  'assets/images/whitebg.svg', // Background image (SVG)
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              // CircleAvatar for team member 4 (Shifted upwards)
                              Positioned(
                                top: 40, // Shifted slightly upwards
                                child: CircleAvatar(
                                  radius: 35, // Circle size
                                  backgroundImage: AssetImage('assets/images/sir.jpg'), // Path to profile image
                                ),
                              ),
                              // Text below the CircleAvatar
                              Positioned(
                                bottom: 50, // Position text just below the CircleAvatar
                                child: Column(
                                  children: [
                                    Text(
                                      'Emily Davis', // Name of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'Tester', // Role of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                         fontWeight: FontWeight.bold,

                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Row to place three small images horizontally (including github.svg)
                              Positioned(
                                bottom: 30, // Adjusted to be just below the "Tester" text
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // Make the Row take minimum space
                                  children: [
                                    // First small image (GitHub icon)
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your small image (GitHub)
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Second small image
                                    SvgPicture.asset(
                                      'assets/images/linked.svg', // Path to your second small image
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Third small image
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your third small image
                                      width: 10,
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // First row of team members (2 images per row)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the row content
                        children: [
                          // Team member 1 with CircleAvatar inside the image
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                width: 150,
                                height: 197,
                                child: SvgPicture.asset(
                                  'assets/images/whitebg.svg', // Background image (SVG)
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              // CircleAvatar for team member 1 (Shifted upwards)
                              Positioned(
                                top: 40, // Shifted slightly upwards
                                child: CircleAvatar(
                                  radius: 35, // Circle size
                                  backgroundImage: AssetImage('assets/images/sir.jpg'), // Path to profile image
                                ),
                              ),
                              // Text below the CircleAvatar
                              Positioned(
                                bottom: 50, // Position text just below the CircleAvatar
                                child: Column(
                                  children: [
                                    Text(
                                      'John Doe', // Name of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'Developer', // Role of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Row to place three small images horizontally (including github.svg)
                              Positioned(
                                bottom: 30, // Adjusted to be just below the "Developer" text
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // Make the Row take minimum space
                                  children: [
                                    // First small image (GitHub icon)
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your small image (GitHub)
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Second small image
                                    SvgPicture.asset(
                                      'assets/images/linkedin.svg', // Path to your second small image
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Third small image
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your third small image
                                      width: 10,
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10), // Space between avatars
                          // Team member 2 with CircleAvatar inside the image
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                width: 150,
                                height: 197,
                                child: SvgPicture.asset(
                                  'assets/images/whitebg.svg', // Background image (SVG)
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              // CircleAvatar for team member 2 (Shifted upwards)
                              Positioned(
                                top: 40, // Shifted slightly upwards
                                child: CircleAvatar(
                                  radius: 35, // Circle size
                                  backgroundImage: AssetImage('assets/images/sir.jpg'), // Path to profile image
                                ),
                              ),
                              // Text below the CircleAvatar
                              Positioned(
                                bottom: 50, // Position text just below the CircleAvatar
                                child: Column(
                                  children: [
                                    Text(
                                      'Jane Smith', // Name of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'Designer', // Role of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Row to place three small images horizontally (including github.svg)
                              Positioned(
                                bottom: 30, // Adjusted to be just below the "Designer" text
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // Make the Row take minimum space
                                  children: [
                                    // First small image (GitHub icon)
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your small image (GitHub)
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Second small image
                                    SvgPicture.asset(
                                      'assets/images/linkedin.svg', // Path to your second small image
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Third small image
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your third small image
                                      width: 10,
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // First row of team members (2 images per row)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the row content
                        children: [
                          // Team member 1 with CircleAvatar inside the image
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                width: 150,
                                height: 197,
                                child: SvgPicture.asset(
                                  'assets/images/whitebg.svg', // Background image (SVG)
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              // CircleAvatar for team member 1 (Shifted upwards)
                              Positioned(
                                top: 40, // Shifted slightly upwards
                                child: CircleAvatar(
                                  radius: 35, // Circle size
                                  backgroundImage: AssetImage('assets/images/sir.jpg'), // Path to profile image
                                ),
                              ),
                              // Text below the CircleAvatar
                              Positioned(
                                bottom: 50, // Position text just below the CircleAvatar
                                child: Column(
                                  children: [
                                    Text(
                                      'John Doe', // Name of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'Developer', // Role of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Row to place three small images horizontally (including github.svg)
                              Positioned(
                                bottom: 30, // Adjusted to be just below the "Developer" text
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // Make the Row take minimum space
                                  children: [
                                    // First small image (GitHub icon)
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your small image (GitHub)
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Second small image
                                    SvgPicture.asset(
                                      'assets/images/linkedin.svg', // Path to your second small image
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Third small image
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your third small image
                                      width: 10,
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10), // Space between avatars
                          // Team member 2 with CircleAvatar inside the image
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                width: 150,
                                height: 197,
                                child: SvgPicture.asset(
                                  'assets/images/whitebg.svg', // Background image (SVG)
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              // CircleAvatar for team member 2 (Shifted upwards)
                              Positioned(
                                top: 40, // Shifted slightly upwards
                                child: CircleAvatar(
                                  radius: 35, // Circle size
                                  backgroundImage: AssetImage('assets/images/sir.jpg'), // Path to profile image
                                ),
                              ),
                              // Text below the CircleAvatar
                              Positioned(
                                bottom: 50, // Position text just below the CircleAvatar
                                child: Column(
                                  children: [
                                    Text(
                                      'Jane Smith', // Name of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'Designer', // Role of the team member
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Row to place three small images horizontally (including github.svg)
                              Positioned(
                                bottom: 30, // Adjusted to be just below the "Designer" text
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, // Make the Row take minimum space
                                  children: [
                                    // First small image (GitHub icon)
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your small image (GitHub)
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Second small image
                                    SvgPicture.asset(
                                      'assets/images/linkedin.svg', // Path to your second small image
                                      width: 10,
                                      height: 10,
                                    ),
                                    SizedBox(width: 7), // Space between images
                                    // Third small image
                                    SvgPicture.asset(
                                      'assets/images/github.svg', // Path to your third small image
                                      width: 10,
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ],
              ),
            
          ),
        );
      
  }
}