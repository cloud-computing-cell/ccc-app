import 'package:ccc_app/controllers/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:get/get.dart';

class Connectus extends StatelessWidget {
  const Connectus({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactController controller = Get.put(ContactController());

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Center(
                    child: Lottie.asset(
                    'assets/lottie/contact_lottie.json',
                    fit: BoxFit.cover,
                    repeat: true,
                    animate: true,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome,",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "We value building strong relationships and staying in touch with you. Whether you have questions, need support, or want to share feedback, we’re here for you.",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(101, 101, 101, 1)),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      labelText: "Enter Your Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your name' : null,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                          .hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: controller.phoneController,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter phone number';
                      }
                      if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                        return 'Enter a 10-digit number';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: TextFormField(
                    controller: controller.messageController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: "Message",
                      hintText: "Describe Your Message",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.message),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a message' : null,
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () => controller.submitContactForm(),
                  child: Container(
                    width: 222,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(86, 125, 244, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "CONNECT WITH US",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Use Social Network to connect with us",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(137, 137, 137, 1)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        openSocialMedia("https://instagram.com/ccc_akgec");
                      },
                      icon: Icon(FontAwesomeIcons.instagram),
                    ),
                    IconButton(
                      onPressed: () {
                        openSocialMedia("https://github.com/alokyadav686");
                      },
                      icon: Icon(FontAwesomeIcons.github),
                    ),
                    IconButton(
                      onPressed: () {
                        openSocialMedia("https://linkedin.com/in/alok2005/");
                      },
                      icon: Icon(FontAwesomeIcons.linkedin),
                    ),
                    IconButton(
                      onPressed: () {
                        openSocialMedia("https://facebook.com/im.alokk_");
                      },
                      icon: Icon(FontAwesomeIcons.facebook),
                    ),
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openSocialMedia(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }
}
