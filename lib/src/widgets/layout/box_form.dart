import 'package:flutter/material.dart';

class BoxForm extends StatelessWidget {
  final double height;
  final double margin;
  final List<Widget>? widgets;
  const BoxForm({super.key, this.height = 0, this.margin = 0, this.widgets });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * height,
      margin: EdgeInsets.only(top: (MediaQuery.of(context).size.height * margin), left: 50, right: 50),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15,
                offset: Offset(0, .75)
            )
          ]
      ),
      child: SingleChildScrollView(
        child: Column(
            children:widgets!
        ),
      ),
    );
  }
}