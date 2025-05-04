import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String? selectedBranch;
  String? selectedSection;
  String? residenceCategory;

  final List<String> branches = [
    'CSE',
    'CS(DS)',
    'CS(AIML)',
    'IT',
    'CSIT',
    'AIML',
    'CSH',
    'ECE',
    'EN',
    'MECH',
    'CIVIL'
  ];
  final List<String> sections = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(50, 37, 55, 1),
              Color.fromRGBO(53, 34, 61, 1)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Lottie.asset(
                  'assets/lottie/register_animation.json',
                  fit: BoxFit.cover,
                  repeat: true,
                  animate: true,
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Register Now",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: const Text(
                  "Excited for NIMBUS 2.0  !!",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 4),
              Center(
                child: const Text(
                  "CODE THE FRAME TO\nWIN EXCITING REWARDS",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ),
              buildTextField("Name", "Enter your Full Name"),
              buildTextField("Student ID", "Enter your Student Number"),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                      child: buildDropdown("Branch", selectedBranch, branches,
                          (val) {
                    setState(() => selectedBranch = val);
                  })),
                  const SizedBox(width: 10),
                  Expanded(
                      child: buildDropdown("Section", selectedSection, sections,
                          (val) {
                    setState(() => selectedSection = val);
                  })),
                ],
              ),
              buildTextField("E-mail ID", "Enter your College E-mail ID"),
              buildTextField("Mobile Number", "Enter your Mobile Number"),
              const SizedBox(height: 20),
              const Text("Residence Category",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              Row(
                children: [
                  buildRadio("Hostler"),
                  buildRadio("Day Scholar"),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                  child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFFE96F6F), Color(0xFF6C4AB6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              )),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Colors.white12,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdown(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            hint: Text("Select $label",
                style: const TextStyle(color: Colors.white54)),
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            dropdownColor: Colors.black87,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item, style: const TextStyle(color: Colors.white)),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget buildRadio(String title) {
    return Row(
      children: [
        Radio<String>(
          value: title,
          groupValue: residenceCategory,
          onChanged: (val) {
            setState(() => residenceCategory = val);
          },
          activeColor: Colors.white,
        ),
        Text(title, style: const TextStyle(color: Colors.white)),
        const SizedBox(width: 20),
      ],
    );
  }
}
