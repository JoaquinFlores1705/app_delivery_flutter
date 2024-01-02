import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  void register(GlobalKey<FormState> form){
    if(form.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String name = nameController.text.trim();
      String lastname = lastnameController.text.trim();
      String phone = phoneController.text.trim();
      String passwordConfirm = passwordConfirmController.text.trim();

      print("Email ${email}");
      print("Password ${password}");
      print("Name ${name}");
      print("Lastname ${lastname}");
      print("Phone ${phone}");
      print("Password Confirm ${passwordConfirm}");

      Get.snackbar('Email', email);
      Get.snackbar('Password', password);
    }
  }

}