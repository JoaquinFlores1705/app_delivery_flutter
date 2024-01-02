import 'package:flutter/material.dart';
import 'package:app_delivery_flutter/src/pages/register/register_controller.dart';
import 'package:app_delivery_flutter/src/widgets/controls/button_back.dart';
import 'package:app_delivery_flutter/src/widgets/controls/button_principal.dart';
import 'package:app_delivery_flutter/src/widgets/controls/image_user.dart';
import 'package:app_delivery_flutter/src/widgets/controls/text_field.dart';
import 'package:app_delivery_flutter/src/widgets/layout/background_cover.dart';
import 'package:app_delivery_flutter/src/widgets/layout/box_form.dart';
import 'package:app_delivery_flutter/src/widgets/layout/text_your_info.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {

  final RegisterController con = Get.put(RegisterController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundCover(height: .35,),
          BoxForm(height: .65, margin: .3, widgets: [
            TextYourInfo(text: 'INGRESA TU INFORMACION', bottom: 30,),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFieldGeneric(type: TextInputType.emailAddress,hintText: 'Correo electronico', icon: Icons.email, controller: con.emailController,),
                    TextFieldGeneric(type: TextInputType.text,hintText: 'Nombre', icon: Icons.person, controller: con.nameController,),
                    TextFieldGeneric(type: TextInputType.text,hintText: 'Apellido', icon: Icons.person_outlined, controller: con.lastnameController,),
                    TextFieldGeneric(type: TextInputType.phone,hintText: 'Telefono', icon: Icons.phone, controller: con.phoneController,),
                    TextFieldGeneric(type: TextInputType.text,hintText: 'Contrasena', icon: Icons.lock, obscureText: true, controller: con.passwordController,),
                    TextFieldGeneric(type: TextInputType.text,hintText: 'Confirmar Contrasena', icon: Icons.lock_outline, obscureText: true, controller: con.passwordConfirmController),
                  ],
                )
            ),

            ButtonPrincipal(text: "REGISTRAR", onPressed: () => con.register(_formKey),)
          ],),
          ImageUser(backgroundImage: 'assets/img/user_profile.png',),
          ButtonBack()
        ],
      ),
    );
  }

}