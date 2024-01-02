import 'package:flutter/material.dart';

class TextDontHaveAccount extends StatelessWidget {
  final Function()? onTap;
  const TextDontHaveAccount({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No tienes cuenta?', style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 17)),
        SizedBox(width: 7,),
        GestureDetector(
            onTap: onTap,
            child: Text('Registrate aqui', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 17))
        )
      ],
    );
  }
}