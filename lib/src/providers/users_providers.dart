import 'package:app_delivery_flutter/src/enviroment/enviroment.dart';
import 'package:app_delivery_flutter/src/models/user.dart';
import 'package:get/get.dart';

class UsersProvider extends GetConnect{
  String url = Enviroment.API_URL + 'api/users';
  
  Future<Response> create(User user) async{
    print(url);
    Response response = await post(
        url,
        user.toJson(),
        headers: {
          'Content-Type': 'application/json'
        }
    );

    return response;
  }

}