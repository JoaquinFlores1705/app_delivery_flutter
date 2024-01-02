import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldGeneric extends StatelessWidget {
  final TextInputType type;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController? controller;
  final bool required;
  const TextFieldGeneric({super.key, this.type = TextInputType.text, this.hintText = "", this.obscureText = false, this.required = false, this.icon, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: obscureText,
        decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(icon)
        ),
        validator: (value){
          if(required && (value==null || value.isEmpty || value=='')){
            return 'Este campo es obligatorio';
          }
          if(value!.trim() != "" && type == TextInputType.emailAddress && !GetUtils.isEmail(value)){
            return 'No es un email valido';
          }
          return null;
        },
      ),
    );
  }
}