import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Domain extends StatefulWidget {
  const Domain({super.key});

  @override
  State<Domain> createState() => _DomainState();
}

class _DomainState extends State<Domain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(flex: 3, child: DomainPhoto()),
        Expanded(flex: 2, child: DomainDetails()),
      ],
    ));
  }
}

class DomainDetails extends StatelessWidget {
  const DomainDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Col,

        );
  }
}

class DomainPhoto extends StatelessWidget {
  const DomainPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromRGBO(19, 20, 23, 1),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20,bottom: 40),
              child: Text(
                "Technical Domains",
                style: TextStyle(
                    fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Stack(
            children: [
              Transform.rotate(
                  angle: -0.12, child: SvgPicture.asset("assets/images/1.svg")),
              Transform.rotate(
                  angle: -0.1, child: SvgPicture.asset("assets/images/2.svg")),
              Transform.rotate(
                  angle: -0.08, child: SvgPicture.asset("assets/images/3.svg")),
              Transform.rotate(
                  angle: -0.06, child: SvgPicture.asset("assets/images/4.svg")),
              Transform.rotate(
                  angle: -0.04, child: SvgPicture.asset("assets/images/5.svg")),
              Transform.rotate(
                  angle: -0.02, child: SvgPicture.asset("assets/images/6.svg")),
              Transform.rotate(
                  angle: 0, child: SvgPicture.asset("assets/images/7.svg")),
            ],
          ),
        ],
      ),
    );
  }
}
