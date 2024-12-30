import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Customnav extends StatefulWidget {
  final ValueChanged<int> onItemSelected;
  const Customnav({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  State<Customnav> createState() => _CustomnavState();
}

class _CustomnavState extends State<Customnav> {
  int selectedIndex = 0;
   bool showSecondNavBar = false;

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: size.width,
       height: showSecondNavBar ? 160 : 80,
      //  height: showSecondNavBar ? 145 : 65,
      child: Stack(
        children: [
                 if (showSecondNavBar)
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
            top: showSecondNavBar?80:0,
            child: CustomPaint(
              size: Size(size.width, 80),
              painter: BNBcustomPainter(),
            ),
          ),
         
          Positioned.fill(
            top: showSecondNavBar?80: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIcon(Icons.home_outlined, 0 , "Home"),
                _buildIcon(Icons.event, 1, "Events"),
                SizedBox(width: size.width * 0.20),
                _buildIcon(Icons.group_add_outlined, 2,"Team"),
                _buildIcon(Icons.quiz_outlined, 3, "Quiz"),
              ],
            ),
          ),
          if (showSecondNavBar)
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
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildIcon(Icons.explore, 4, "Projects"),
                      _buildIcon(Icons.phone, 5, "Contact"),
                      SizedBox(width: size.width * 0.06),
                      _buildIcon(Icons.contact_page_rounded, 6, "Register"),
                      _buildIcon(Icons.info_outline, 7, "Domain"),
                    ],
                  ),
                ),
              ),
            ),
             Positioned(
            top: showSecondNavBar?80:0,
            left: 0,
            right: 0,
            child: Center(
              heightFactor: 0.6,
              child: Transform.scale(
                scale: 1.3,
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      showSecondNavBar = !showSecondNavBar;
                    });
                  },
                  backgroundColor: Colors.white,
                  child: Transform.scale(
                    scale: 1.4,
                
                    child: SvgPicture.asset("assets/images/explore.svg",fit: BoxFit.cover,)),
                  shape: const CircleBorder(),
                  
                ),
              ),
              
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index, String name) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Color.fromRGBO(116, 123, 131, 1),
            size: isSelected ? 35 : 30,
          ),
          const SizedBox(height: 2),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.white : Color.fromRGBO(116, 123, 131, 1),
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
    Paint paint = Paint()..color = const Color.fromRGBO(29, 31, 36, 1)..style = PaintingStyle.fill;

    Path path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: const Radius.circular(10), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return false;
  }
}
