import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 19, 22, 1),
    
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                
                Container(
                  width: double.infinity,
                  height: 235.44,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/annni.png"),fit: BoxFit.cover),
                    // color: Colors.amber
                  ),
                ),
                SvgPicture.asset("assets/images/reg.svg"),
                
              
            
            
              ],
            ),
          ],
        ),
      ),
    );
  }
}