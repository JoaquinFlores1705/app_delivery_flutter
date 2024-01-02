import 'package:flutter/material.dart';

class ImageCover extends StatelessWidget {
  final String srcImg;
  const ImageCover({super.key, this.srcImg = ""});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 15),
        alignment: Alignment.center,
        child: Image.asset(
          srcImg,
          width: 130,
          height: 130,
        ),
      ),
    );
  }
}