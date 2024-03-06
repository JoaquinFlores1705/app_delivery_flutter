import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AlertGaleryCamera{

  final Function? onUpdate;
  final ImagePicker picker = ImagePicker();
  File? imageFile;

  AlertGaleryCamera({this.onUpdate});

  Future selectImage(ImageSource imageSource) async{
    XFile? image = await picker.pickImage(source: imageSource);
    if(image != null){
      imageFile = File(image.path);
      this.onUpdate!();
    }
  }

  void showAlertDialog(BuildContext context){
    Widget galleryButton = ElevatedButton(
        onPressed: (){
          Get.back();
          selectImage(ImageSource.gallery);
        },
        child: Text('Galeria',
            style: TextStyle(color: Colors.black))
    );

    final Widget cameraButton = ElevatedButton(
        onPressed: (){
          Get.back();
          selectImage(ImageSource.camera);
        },
        child: Text('Camara',
            style: TextStyle(color: Colors.black))
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text('Selecciona una opcion'),
      actions: [
        galleryButton,
        cameraButton
      ],
    );

    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }



}