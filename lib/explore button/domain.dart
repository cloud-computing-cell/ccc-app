import 'package:ccc_app/background%20Animation/bganimation.dart';
import 'package:flutter/material.dart';

class Domain extends StatefulWidget {
  const Domain({super.key});

  @override
  State<Domain> createState() => _DomainState();
}

class _DomainState extends State<Domain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      body: Stack(
        children: [
          CircleRotationAnimation(),
          
        ],
      ),
    );
  }
}