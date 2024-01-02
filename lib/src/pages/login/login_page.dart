import 'package:flutter/material.dart';
import 'package:app_delivery_flutter/src/pages/login/login_controller.dart';
import 'package:app_delivery_flutter/src/widgets/controls/button_principal.dart';
import 'package:app_delivery_flutter/src/widgets/controls/text_field.dart';
import 'package:app_delivery_flutter/src/widgets/layout/background_cover.dart';
import 'package:app_delivery_flutter/src/widgets/layout/box_form.dart';
import 'package:app_delivery_flutter/src/widgets/layout/image_cover.dart';
import 'package:app_delivery_flutter/src/widgets/layout/text_appname.dart';
import 'package:app_delivery_flutter/src/widgets/layout/text_dont_have_account.dart';
import 'package:app_delivery_flutter/src/widgets/layout/text_your_info.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final LoginController con = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            height: 50,
            child: TextDontHaveAccount(onTap: () => con.goToRegisterPage(),)
        ),
        body: Stack(
          children: [
            BackgroundCover(height: .42,),
            BoxForm(height: .45, margin: .35, widgets: [
              TextYourInfo(text: 'INGRESA TU INFORMACION',),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldGeneric(type: TextInputType.emailAddress,hintText: 'Correo electronico', icon: Icons.email, controller: con.emailController, required: true,),
                      TextFieldGeneric(type: TextInputType.text,hintText: 'Contrasena', icon: Icons.lock, obscureText: true, controller: con.passwordController, required: true,),
                    ],
                  )
              ),

              ButtonPrincipal(text: "LOGIN", onPressed: () => con.login(_formKey),)
            ],),
            Column(
              children: [
                ImageCover(srcImg: "assets/img/delivery.png",),
                TextAppName(name: 'Delivery MySQL',),

              ],
            )
          ],
        )
    );
  }
}
