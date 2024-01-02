import 'package:flutter/material.dart';

class TextYourInfo extends StatelessWidget {
  final String text;
  final double bottom;
  const TextYourInfo({super.key, this.text = "", this.bottom = 45});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40, bottom: bottom),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16
          ),
        )
    );
  }
}