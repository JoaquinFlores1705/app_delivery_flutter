import 'package:app_delivery_flutter/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  final HomeController con = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => con.logout(),
          child: Text('Cerrar Sesion', style: TextStyle(color: Colors.black),),
        )
      ),
    );
  }
}