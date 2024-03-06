import 'dart:convert';
import 'dart:ffi';

ResponseApi userFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {

  ResponseApi({
    this.status,
    this.statusMsg,
    this.data,
    this.message
  });

  int? status;
  String? statusMsg;
  String? message;
  dynamic data;

  factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
    status: json["status"],
    statusMsg: json["statusMsg"],
    message: json["message"],
    data: json["data"]
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusMsg": statusMsg,
    "message": message,
    "data": data
  };
}