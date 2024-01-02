import 'package:flutter/material.dart';

class ImageUser extends StatelessWidget {

  final Function()? onTap;
  final String backgroundImage;

  const ImageUser({super.key, this.backgroundImage = "", this.onTap});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundImage: AssetImage(backgroundImage),
            radius: 60,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}