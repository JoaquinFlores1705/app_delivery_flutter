import 'package:flutter/material.dart';

class BackgroundCover extends StatelessWidget {

  final double height;
  const BackgroundCover({super.key, this.height = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * height,
      color: Colors.amber,
    );
  }
}