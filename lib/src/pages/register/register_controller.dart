import 'package:app_delivery_flutter/src/models/user.dart';
import 'package:app_delivery_flutter/src/providers/users_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  UsersProvider userProvider = UsersProvider();

  void register(GlobalKey<FormState> form) async {
    if(form.currentState!.validate()) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String name = nameController.text.trim();
      String lastname = lastnameController.text.trim();
      String phone = phoneController.text.trim();
      String passwordConfirm = passwordConfirmController.text.trim();

      User user = User(
          name: name,
          lastname: lastname,
          email: email,
          phone: phone,
          image: "",
          password: password);

      Response response = await userProvider.create(user);
      
      print(user.id);

      print('RESPONSE ${response.body}');
    }
  }
}