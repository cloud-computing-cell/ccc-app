import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class ContactController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  final formKey = GlobalKey<FormState>(); // for validation

  Future<void> submitContactForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final String url = 'https://website-9egw.onrender.com/api/contact';

    final Map<String, String> data = {
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'message': messageController.text.trim(),
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Your message has been sent!',
            snackPosition: SnackPosition.BOTTOM);
        clearFields();
      } else {
        Get.snackbar('Error', 'Failed to send message. Please try again.',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred. Please try again.',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void clearFields() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    messageController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
