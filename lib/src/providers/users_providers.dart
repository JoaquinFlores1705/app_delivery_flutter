import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:app_delivery_flutter/src/enviroment/enviroment.dart';
import 'package:app_delivery_flutter/src/models/response_api.dart';
import 'package:app_delivery_flutter/src/models/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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

  Future<Stream> createWithImage(User user, File image) async {
    Uri uri = Uri.http(Enviroment.API_URL_OLD, 'api/users/user-image');
    final request = http.MultipartRequest('POST', uri);
    request.files.add(http.MultipartFile(
      'image',
      http.ByteStream(image.openRead().cast()),
      await image.length(),
      filename: basename(image.path)
    ));
    request.fields['user'] = json.encode(user.toJson());
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  /*
  * Utilizando GetX
  * */
  Future<ResponseApi> createWithImageGetX(User user, File image) async{
    FormData form = FormData({
      'image': MultipartFile(image, filename: basename(image.path)),
      'user': json.encode(user)
    });
    Response response = await post(
        '$url/user-image',
        form
    );

    if(response.body == null){
      Get.snackbar('Error en la peticion', 'No se pudo crear el usuario');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  Future<ResponseApi> login(String email, String password) async{
    print(url);
    Response response = await post(
        '$url/login',
        {
          'email': email,
          'password': password
        },
        headers: {
          'Content-Type': 'application/json'
        }
    );

    if(response.body == null){
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }

}