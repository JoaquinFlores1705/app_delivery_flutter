import 'package:app_delivery_flutter/src/models/response_api.dart';
import 'package:app_delivery_flutter/src/providers/users_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider userProvider = UsersProvider();

  void goToRegisterPage(){
    Get.toNamed('/register');
  }

  void goToHomePage(){
    Get.offNamedUntil('/home', (route) => false);
  }

  void login(GlobalKey<FormState> form) async{
    if(form.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      ResponseApi response = await userProvider.login(email, password);

      print('Reponse Api: ${response.toJson()}');

      if(response.status == 200){
        GetStorage().write('user', response.data);
        goToHomePage();
      }else{
        Get.snackbar('Login Fallido', response.data!);
      }

    }
  }
}