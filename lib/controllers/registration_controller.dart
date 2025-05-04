import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final idController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final transactionIdController = TextEditingController();

  var selectedBranch = RxnString();
  var selectedSection = RxnString();
  var selectedResidence = RxnString();
  var selectedGender = RxnString();

  var showPaymentSection = false.obs;
  var isLoading = false.obs;

  final branches = [
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

  final sections = List.generate(20, (i) => '${i + 1}');
  final residences = ['Hosteller', 'DayScholar'];
  final genders = ['Male', 'Female', 'Others'];

  Future<void> submitRegistration() async {
    final url = Uri.parse('https://backendrough.onrender.com/api/app/signUp');
    isLoading.value = true;

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "phoneNumber": int.tryParse(mobileController.text.trim()),
          "studentNumber": int.tryParse(idController.text.trim()),
          "branch": selectedBranch.value?.toLowerCase(),
          "section": selectedSection.value,
          "gender": selectedGender.value?.toLowerCase(),
          "residence": selectedResidence.value?.toLowerCase(),
          "transactionID": transactionIdController.text.trim(),
        }),
      );

      isLoading.value = false;

      if (response.statusCode == 201) {
        Get.snackbar("Success", "Registration successful!",
            backgroundColor: Colors.green, colorText: Colors.white);

        formKey.currentState?.reset();
        nameController.clear();
        idController.clear();
        emailController.clear();
        mobileController.clear();
        transactionIdController.clear();

        selectedBranch.value = null;
        selectedSection.value = null;
        selectedResidence.value = null;
        selectedGender.value = null;
        showPaymentSection.value = false;
      } else {
        Get.snackbar("Failed", response.body,
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
