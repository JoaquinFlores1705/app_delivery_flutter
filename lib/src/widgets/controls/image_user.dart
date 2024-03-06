import 'dart:io';

import 'package:app_delivery_flutter/src/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageUser extends StatelessWidget {

  final Function()? onTap;
  final String backgroundImage;
  File? imageFile;

  ImageUser({super.key, this.backgroundImage = "", this.onTap, this.imageFile});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
              backgroundImage: imageFile != null //sas
                  ?FileImage(imageFile!)
                  :AssetImage(backgroundImage)
              as ImageProvider,
              radius: 60,
              backgroundColor: Colors.white,
            ),
        ),
      ),
    );
  }
}