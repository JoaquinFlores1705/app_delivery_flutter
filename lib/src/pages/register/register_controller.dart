import 'dart:convert';

import 'package:app_delivery_flutter/src/models/response_api.dart';
import 'package:app_delivery_flutter/src/models/user.dart';
import 'package:app_delivery_flutter/src/providers/users_providers.dart';
import 'package:app_delivery_flutter/src/widgets/controls/AddPhotoGalery/alert_galery_camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class RegisterController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  AlertGaleryCamera? alert;

  UsersProvider userProvider = UsersProvider();

  RegisterController(){
    alert = AlertGaleryCamera(onUpdate: () => updateController());
  }

  void updateController(){
    update();
    print('Se actualizo');
  }

  void goToHomePage(){
    Get.offNamedUntil('/home', (route) => false);
  }

  void register(BuildContext context, GlobalKey<FormState> form) async {
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

      if(isValidImage()){
        ProgressDialog dialog = new ProgressDialog(context: context);
        dialog.show(max: 100, msg: 'Registrando datos...');
        print(alert!.imageFile);
        Stream stream = await userProvider.createWithImage(user, alert!.imageFile!);
        stream.listen((res) {
          dialog.close();
          print(res);
          ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));
          if(responseApi.status == 200){
            print(responseApi.data);
            GetStorage().write('user', responseApi.data);
            goToHomePage();
          }else{
            Get.snackbar('Registro fallido', responseApi.message!);
          }
        });
      }
    }
  }

  bool isValidImage(){
    if(alert!.imageFile == null){
      Get.snackbar('Imagen no valida', 'Debes seleccionar una imagen de perfil');
      return false;
    }
    return true;
  }
}