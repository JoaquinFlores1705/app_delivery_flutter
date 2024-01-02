import 'package:flutter/material.dart';

class TextAppName extends StatelessWidget {
  final String name;
  const TextAppName({super.key, this.name = ""});

  @override
  Widget build(BuildContext context) {
    return Text(name,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24 ,
          color: Colors.black
      ),
    );
  }
}