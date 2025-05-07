import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OurVision extends StatelessWidget {
  const OurVision({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "OUR VISION",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            )),
      ),
      SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color.fromRGBO(73, 78, 168, 1), width: 2.5)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 40, bottom: 10),
                    child: Text(
                      "We think creatively and strategically to design websites and Apps that are visually captivating, easy to navigate, and highly functional. Our thoughtful approach ensures every aspect, from performance to scalability, aligns with delivering exceptional user experiences",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -40,
              right: 0,
              child: ClipOval(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset("assets/images/think.svg"),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color.fromRGBO(73, 78, 168, 1), width: 2.5)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 40, bottom: 10),
                    child: Text(
                      "Development is the foundation  of creating dynamic web and mobile applications that power modern life. Web development focuses on building interactive and responsive websites, from user-friendly frontends using HTML, CSS, and JavaScript to robust backends with frameworks like Node.js and Django. Similarly, app development combines creativity and engineering to craft mobile solutions By Flutter, React Native, or Kotlin.",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: -40,
                left: 0,
                child: ClipOval(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: SvgPicture.asset("assets/images/develop.svg"),
                  ),
                ))
          ],
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color.fromRGBO(73, 78, 168, 1), width: 2.5)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 40, bottom: 10),
                    child: Text(
                      "We think creatively and strategically to design websites and Apps that are visually captivating, easy to navigate, and highly functional. Our thoughtful approach ensures every aspect, from performance to scalability, aligns with delivering exceptional user experiences",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -40,
              right: 0,
              child: ClipOval(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset("assets/images/deploy.svg"),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    ]);
  }
}
