import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage(){
    Get.toNamed('/register');
  }

  void login(GlobalKey<FormState> form){
    if(form.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      print("Email ${email}");
      print("Password ${password}");

      Get.snackbar('Email', email);
      Get.snackbar('Password', password);
    }
  }
}