import 'package:ccc_app/controllers/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatelessWidget {
  final controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(50, 37, 55, 1),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromRGBO(50, 37, 55, 1), Color.fromRGBO(53, 34, 61, 1)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Lottie.asset('assets/lottie/register_animation.json'),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text("Excited for NIMBUS 2.0  !!", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 4),
                const Center(
                  child: Text("CODE THE FRAME TO\nWIN EXCITING REWARDS", textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 14)),
                ),
                buildTextField("Name", "Enter your Full Name", controller.nameController),
                buildTextField("Student ID", "Enter your Student Number", controller.idController),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: buildDropdown("Branch", controller.selectedBranch, controller.branches)),
                    const SizedBox(width: 10),
                    Expanded(child: buildDropdown("Section", controller.selectedSection, controller.sections)),
                  ],
                ),
                buildTextField("E-mail ID", "Enter your College E-mail ID", controller.emailController),
                buildTextField("Mobile Number", "Enter your Mobile Number", controller.mobileController),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: buildDropdown("Residence", controller.selectedResidence, controller.residences)),
                    const SizedBox(width: 10),
                    Expanded(child: buildDropdown("Gender", controller.selectedGender, controller.genders)),
                  ],
                ),
                const SizedBox(height: 30),
                Obx(() => !controller.showPaymentSection.value
                    ? GestureDetector(
                        onTap: () {
                          if (controller.formKey.currentState!.validate() &&
                              controller.selectedBranch.value != null &&
                              controller.selectedSection.value != null &&
                              controller.selectedResidence.value != null &&
                              controller.selectedGender.value != null) {
                            controller.showPaymentSection.value = true;
                          } else {
                            Get.snackbar("Missing Info", "Please fill all fields and make selections.",
                                backgroundColor: Colors.orange, colorText: Colors.white);
                          }
                        },
                        child: actionButton("Next", Color(0xFFE96F6F), Color(0xFF6C4AB6)),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Proceed to Payment", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                          const SizedBox(height: 10),
                          const Text("Scan the QR code below using any UPI app to pay ₹100. After the payment is completed, enter your Transaction ID below.",
                              style: TextStyle(color: Colors.white70)),
                          const SizedBox(height: 20),
                          Center(child: Image.asset('assets/images/payment_qr.png', width: 200, height: 200)),
                          const SizedBox(height: 20),
                          buildTextField("Transaction ID", "Enter Transaction ID", controller.transactionIdController),
                          const SizedBox(height: 30),
                          Obx(() => controller.isLoading.value
                              ? const Center(child: CircularProgressIndicator(color: Colors.white))
                              : GestureDetector(
                                  onTap: () {
                                    if (controller.transactionIdController.text.isNotEmpty) {
                                      controller.submitRegistration();
                                    } else {
                                      Get.snackbar("Missing Info", "Please enter the Transaction ID.",
                                          backgroundColor: Colors.red, colorText: Colors.white);
                                    }
                                  },
                                  child: actionButton("Submit", Color(0xFF6C4AB6), Color(0xFFE96F6F)),
                                )),
                        ],
                      )),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint, TextEditingController controller) {
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
            validator: (value) => (value == null || value.isEmpty) ? '$label is required' : null,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.white70),
              filled: true,
              fillColor: Colors.white12,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDropdown(String label, RxnString selectedValue, List<String> items) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(10)),
              child: DropdownButtonFormField<String>(
                value: selectedValue.value,
                hint: Text("Select $label", style: const TextStyle(color: Colors.white54)),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                dropdownColor: Colors.black87,
                decoration: const InputDecoration(border: InputBorder.none, contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                items: items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item, style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
                onChanged: (val) => selectedValue.value = val,
                validator: (val) => val == null ? 'Please select $label' : null,
              ),
            ),
          ],
        ));
  }

  Widget actionButton(String label, Color startColor, Color endColor) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [startColor, endColor], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}
