import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedBranch;
  String? selectedSection;
  String? residenceCategory;

  final nameController = TextEditingController();
  final idController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();

  final List<String> branches = [
    'CSE',
    'CS(DS)',
    'CS(AIML)',
    'IT',
    'CSIT',
    'AIML',
    'CSE(HINDI)',
    'ECE',
    'EN',
    'MECH',
    'CIVIL'
  ];
  final List<String> sections = List.generate(20, (i) => '${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 37, 55, 1),
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
          child: Form(
            key: _formKey,
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
                  child: const Center(
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
                const Center(
                  child: Text(
                    "Excited for NIMBUS 2.0  !!",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 4),
                const Center(
                  child: Text(
                    "CODE THE FRAME TO\nWIN EXCITING REWARDS",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
                buildTextField("Name", "Enter your Full Name", nameController),
                buildTextField(
                    "Student ID", "Enter your Student Number", idController),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: buildDropdown("Branch", selectedBranch, branches,
                          (val) {
                        setState(() => selectedBranch = val);
                      }),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: buildDropdown("Section", selectedSection, sections,
                          (val) {
                        setState(() => selectedSection = val);
                      }),
                    ),
                  ],
                ),
                buildEmailField(),
                buildMobileField(),
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
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate() &&
                          selectedBranch != null &&
                          selectedSection != null &&
                          residenceCategory != null) {
                        //isme abhi navigate
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  "Please fill all fields and make selections.")),
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xFFE96F6F), Color(0xFF6C4AB6)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String label, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$label is required';
              }
              return null;
            },
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

  Widget buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("E-mail ID", style: TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          TextFormField(
            controller: emailController,
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Email is required';
              final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@akgec\.ac\.in$');
              if (!emailRegex.hasMatch(value)) {
                return 'Use college email (e.g. name@akgec.ac.in)';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Enter your College E-mail ID",
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

  Widget buildMobileField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Mobile Number", style: TextStyle(color: Colors.white)),
          const SizedBox(height: 8),
          TextFormField(
            controller: mobileController,
            keyboardType: TextInputType.phone,
            style: const TextStyle(color: Colors.white),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Mobile is required';
              if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                return 'Enter valid 10-digit mobile number';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Enter your Mobile Number",
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
            validator: (val) => val == null ? 'Please select $label' : null,
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
