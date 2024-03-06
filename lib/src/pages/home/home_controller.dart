import 'package:app_delivery_flutter/src/models/user.dart';
import 'package:app_delivery_flutter/src/widgets/controls/AddPhotoGalery/alert_galery_camera.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController{
  User user = User.fromJson(GetStorage().read('user') ?? {});

  HomeController(){
    print('USUARIO DE SESSION: ${user.toJson()}');

  }

  void logout(){
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }
}