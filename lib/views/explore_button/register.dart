// main.dart
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const MaterialApp(home: Register()));

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/square.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/header_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const PositionedButton(),
                const SizedBox(height: 8),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Excited for NIMBUS 2.0 !!\nCODE THE FRAME TO\nWIN EXCITING REWARDS',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: RegistrationForm(),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PositionedButton extends StatelessWidget {
  const PositionedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 220.36,
      left: 56,
      child: SizedBox(
        width: 300.4,
        height: 57.15,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.04),
            ),
          ),
          onPressed: () {},
          child: Text(
            'Register Now',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              height: 0.6,
              letterSpacing: 0.28,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final idController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  String? branch;
  String? section;
  String? residence;

  Future<String?> showRecaptchaDialog(BuildContext context) async {
    final controller = WebViewController();
    final completer = Completer<String?>();

    controller.setNavigationDelegate(
      NavigationDelegate(
        onNavigationRequest: (request) {
          if (request.url.startsWith("https://recaptcha.success/#")) {
            final token = request.url.split("#").last;
            Navigator.of(context).pop();
            completer.complete(token);
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    );

    controller.loadFlutterAsset('assets/recaptcha.html');

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: SizedBox(
          width: 300,
          height: 400,
          child: WebViewWidget(controller: controller),
        ),
      ),
    );

    return completer.future;
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final token = await showRecaptchaDialog(context);
    if (token == null) {
      _showDialog("Error", "reCAPTCHA verification failed");
      return;
    }

    final url = Uri.parse('https://registerbackend-4dz1.onrender.com/api/register/signup');
    final body = {
      'name': nameController.text,
      'studentID': idController.text,
      'branch': branch,
      'section': section,
      'email': emailController.text,
      'mobile': mobileController.text,
      'residence': residence,
      'token': token,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      final data = json.decode(response.body);
      if (response.statusCode == 200 && data['success'] == true) {
        _showDialog('Success', 'Registered Successfully!');
      } else {
        _showDialog('Error', data['message'] ?? 'Registration failed');
      }
    } catch (e) {
      _showDialog('Error', 'Something went wrong. Try again.');
    }
  }

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: nameController,
            label: 'Name',
            hint: 'Enter your Full Name',
            width: 314,
            height: 55,
            borderRadius: 8,
            borderWidth: 0.3,
            rotate: 0,
          ),
          CustomTextField(
            controller: idController,
            label: 'Student ID',
            hint: 'Enter your Student Number',
            width: 314,
            height: 55,
            borderRadius: 8,
            borderWidth: 0.3,
            rotate: 0,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomDropdown(
                  label: 'Branch',
                  value: branch,
                  items: ['CSE', 'CSIT', 'IT', 'CSDS', 'AIML', 'CSH', 'ECE', 'EN', 'MECH', 'CIVIL'],
                  onChanged: (val) => setState(() => branch = val),
                ),
                const SizedBox(width: 12),
                CustomDropdown(
                  label: 'Section',
                  value: section,
                  items: ['1', '2', '3', '4', '5', '6', '7'],
                  onChanged: (val) => setState(() => section = val),
                ),
              ],
            ),
          ),
          CustomTextField(
            controller: emailController,
            label: 'E-mail ID',
            hint: 'Enter your College E-mail ID',
            width: 314,
            height: 55,
            borderRadius: 8,
            borderWidth: 0.3,
            rotate: 0,
          ),
          CustomTextField(
            controller: mobileController,
            label: 'Mobile Number',
            hint: 'Enter your Mobile Number',
            width: 314,
            height: 55,
            borderRadius: 8,
            borderWidth: 0.3,
            rotate: 0,
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Residence Category',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResidenceRadio(
                label: 'Hostler',
                groupValue: residence,
                onChanged: (val) => setState(() => residence = val),
              ),
              const SizedBox(width: 20),
              ResidenceRadio(
                label: 'Day Scholar',
                groupValue: residence,
                onChanged: (val) => setState(() => residence = val),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Continue with next', style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 12),
          SizedBox(
            width: 314,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: _submitForm,
              child: const Text(
                'Next',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

// CustomTextField, CustomDropdown, and ResidenceRadio widgets stay the same as in your code
// Be sure to include assets/recaptcha.html as explained in the previous message
