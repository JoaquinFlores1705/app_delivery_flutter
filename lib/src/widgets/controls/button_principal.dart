import 'package:flutter/material.dart';

class ButtonPrincipal extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const ButtonPrincipal({super.key, this.text = "", this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 20)
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )),
    );
  }
}