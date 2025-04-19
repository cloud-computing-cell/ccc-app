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
                               
                
                
                SvgPicture.asset("assets/images/registration.svg"),
                
              
            
            
              ],
            ),
          ],
        ),
      ),
    );
  }
}