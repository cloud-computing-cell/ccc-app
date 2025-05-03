import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lottie/lottie.dart';

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
                  child: Lottie.asset(
                    'assets/animation.json',
                    fit: BoxFit.cover,
                    repeat: true,
                    animate: true,
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

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final url = Uri.parse('https://registerbackend-4dz1.onrender.com/api/register/signup');

    final body = {
      'name': nameController.text,
      'studentID': idController.text,
      'branch': branch,
      'section': section,
      'email': emailController.text,
      'mobile': mobileController.text,
      'residence': residence,
    };

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(body),
      );

      final data = json.decode(response.body);
      if (response.statusCode == 200) {
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
              alignment: Alignment.center,
              child: Text(
                'Residence Category',
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
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
          SizedBox(
            width: 314,
            height: 55,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/next.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
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
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? borderWidth;
  final double? rotate;
  final TextEditingController? controller;

  const CustomTextField({
    required this.label,
    required this.hint,
    this.width,
    this.height,
    this.borderRadius,
    this.borderWidth,
    this.rotate,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Transform.rotate(
        angle: (rotate ?? 0) * pi / 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 6),
            SizedBox(
              width: width,
              height: height,
              child: TextFormField(
                controller: controller,
                validator: (value) => value == null || value.isEmpty ? 'This field is required' : null,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.5),
                      width: borderWidth ?? 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    borderSide: BorderSide(
                      color: Colors.white.withOpacity(0.5),
                      width: borderWidth ?? 0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: borderWidth ?? 0,
                    ),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 6),
        Container(
          width: 140,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white, width: 0.3),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            dropdownColor: Colors.black,
            iconEnabledColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.all(12)),
            items: items.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

class ResidenceRadio extends StatelessWidget {
  final String label;
  final String? groupValue;
  final Function(String) onChanged;

  const ResidenceRadio({
    required this.label,
    required this.groupValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
          value: label,
          groupValue: groupValue,
          onChanged: (value) => onChanged(label),
        ),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
