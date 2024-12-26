import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Connectus extends StatefulWidget {
  const Connectus({super.key});

  @override
  State<Connectus> createState() => _ConnectusState();
}

class _ConnectusState extends State<Connectus> {
  final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
    final TextEditingController msgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
                    children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/contactus.png"),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Text(
                "We value building strong relationships and staying in touch with you. Whether you have questions, need support, or want to share feedback, we’re here for you.",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(101, 101, 101, 1)),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Let’s stay connected and grow together!",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  )),
            ),
            SizedBox(height: 10,),
            
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Enter Your Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
              ),
            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
              ),
            
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: TextField(
                  controller: msgController,
                  decoration: InputDecoration(
                    labelText: "Message",
                    hintText: "Describe Your Message",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.message),
                  ),
                ),
              ),
               SizedBox(height: 10),
              InkWell(
                onTap: () {
                  

                },
                child: Container(
                  width: 222,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(86, 125, 244, 1),
                    borderRadius: BorderRadius.circular(10)
                    
                  ),
                  child: Center(child: Text("CONNECT WITH US",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white),)),
                ),
              ),
               SizedBox(height: 5),
               Text("Use Social  Network to connect with us",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color.fromRGBO(137, 137, 137, 1)),),

               Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: (){
                        openSocialMedia("https://instagram.com/im.alokk_");
                      },
                     icon: SvgPicture.asset("assets/images/instagram.svg")
                     ),
                     SizedBox(width: 2,),

                     IconButton(
                      onPressed: (){
                        openSocialMedia("https://instagram.com/im.alokk_");
                      },
                     icon: SvgPicture.asset("assets/images/github.svg")
                     ),
                     SizedBox(width: 2,),

                     IconButton(
                      onPressed: (){
                        openSocialMedia("https://instagram.com/im.alokk_");
                      },
                     icon: SvgPicture.asset("assets/images/linkedin.svg")
                     ),
                     SizedBox(width: 2,),

                     IconButton(
                      onPressed: (){
                        openSocialMedia("https://instagram.com/im.alokk_");
                      },
                     icon: SvgPicture.asset("assets/images/facebook.svg")
                     ),
                     
                  ],
                ),
               ),
            
               SizedBox(height: 20),
                    ],
                  ),
          )),
    );
  }
  void openSocialMedia(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
}