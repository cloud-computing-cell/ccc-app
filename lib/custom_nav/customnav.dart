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

  void onTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 80,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, 80),
            painter: BNBcustomPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: Transform.scale(
              scale: 1.3,
              child: FloatingActionButton(
                onPressed: () {
                 
                 
                },
                backgroundColor: Colors.white,
                child: Transform.scale(
                  scale: 1.4,
              
                  child: SvgPicture.asset("assets/images/explore.svg",fit: BoxFit.cover,)),
                shape: const CircleBorder(),
                
              ),
            ),
            
          ),
          Positioned.fill(
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