import 'package:ccc_app/controllers/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Customnav extends StatelessWidget {
  final ValueChanged<int> onItemSelected;

  Customnav({super.key, required this.onItemSelected});

  final NavigationController navController = Get.find();

  final List<String> iconn = [
    "assets/images/home.svg",
    "assets/images/event.svg",
    "assets/images/teamicon.svg",
    "assets/images/quizicon.svg",
    "assets/images/projecticon.svg",
    "assets/images/connecticon.svg",
    "assets/images/registericon.svg",
    "assets/images/domainicon.svg",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(() {
      final isExpanded = navController.showSecondNavBar.value;
      final selectedIndex = navController.selectedIndex.value;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: size.width,
        height: isExpanded ? 160 : 80,
        child: Stack(
          children: [
            if (isExpanded)
              Positioned.fill(
                top: 15,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    color: Colors.black,
                  ),
                ),
              ),
            Positioned(
              top: isExpanded ? 80 : 0,
              child: CustomPaint(
                size: Size(size.width, 80),
                painter: BNBcustomPainter(),
              ),
            ),
            Positioned.fill(
              top: isExpanded ? 80 : 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildIcon(iconn[0], 0, "Home", selectedIndex),
                  _buildIcon(iconn[1], 1, "Events", selectedIndex),
                  SizedBox(width: size.width * 0.20),
                  _buildIcon(iconn[2], 2, "Team", selectedIndex),
                  _buildIcon(iconn[3], 3, "Quiz", selectedIndex),
                ],
              ),
            ),
            if (isExpanded)
              Positioned(
                top: 15,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildIcon(iconn[4], 4, "Projects", selectedIndex),
                        _buildIcon(iconn[5], 5, "Contact us", selectedIndex),
                        SizedBox(width: size.width * 0.06),
                        _buildIcon(iconn[6], 6, "Register", selectedIndex),
                        _buildIcon(iconn[7], 7, "Domain", selectedIndex),
                      ],
                    ),
                  ),
                ),
              ),
            Positioned(
              top: isExpanded ? 80 : 0,
              left: 0,
              right: 0,
              child: Center(
                heightFactor: 0.6,
                child: Transform.scale(
                  scale: 1.3,
                  child: FloatingActionButton(
                    onPressed: navController.toggleSecondNav,
                    backgroundColor: Colors.white,
                    shape: const CircleBorder(),
                    child: Transform.scale(
                      scale: 1.4,
                      child: SvgPicture.asset(
                        "assets/images/explore.svg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildIcon(String icon, int index, String name, int selectedIndex) {
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        navController.changeIndex(index);
        onItemSelected(index); // notify main screen
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: isSelected ? 35 : 30,
            height: isSelected ? 35 : 30,
            child: SvgPicture.asset(
              icon,
              color: isSelected
                  ? Colors.white
                  : const Color.fromRGBO(116, 123, 131, 1),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? Colors.white
                  : const Color.fromRGBO(116, 123, 131, 1),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class BNBcustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = const Color.fromRGBO(29, 31, 36, 1)
      ..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(10), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}