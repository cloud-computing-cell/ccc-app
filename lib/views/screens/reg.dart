import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SVG Background
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/Rectangle.svg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                // Header Section with SVG
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'assets/header_image.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                PositionedButton(),
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

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
          label: 'Name',
          hint: 'Enter your Full Name',
          width: 314,
          height: 55,
          borderRadius: 8,
          borderWidth: 0.3,
          rotate: 0,
        ),
        const CustomTextField(
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
            children: const [
              CustomDropdown(label: 'Branch'),
              SizedBox(width: 12),
              CustomDropdown(label: 'Section'),
            ],
          ),
        ),
        const CustomTextField(
          label: 'E-mail ID',
          hint: 'Enter your College E-mail ID',
          width: 314,
          height: 55,
          borderRadius: 8,
          borderWidth: 0.3,
          rotate: 0,
        ),
        const CustomTextField(
          label: 'Mobile Number',
          hint: 'Enter your Mobile Number',
          width: 314,
          height: 55,
          borderRadius: 8,
          borderWidth: 0.3,
          rotate: 0,
        ),
      ],
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

  const CustomTextField({
    required this.label,
    required this.hint,
    this.width,
    this.height,
    this.borderRadius,
    this.borderWidth,
    this.rotate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget field = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 6),
        SizedBox(
          width: width,
          height: height,
          child: TextField(
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
        )
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Transform.rotate(
        angle: (rotate ?? 0) * pi / 180,
        child: field,
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String label;
  const CustomDropdown({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Transform.rotate(
        angle: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 6),
            Container(
              width: 150,
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                  width: 0.3,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: null,
                  hint: Text('Select', style: TextStyle(color: Colors.grey[400])),
                  items: const [
                    DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
                    DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
                  ],
                  onChanged: (value) {},
                  dropdownColor: const Color(0xFF2E1A47),
                  iconEnabledColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
