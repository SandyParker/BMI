import 'package:flutter/material.dart';

class ChildCards extends StatelessWidget {
  ChildCards({required this.icon, required this.text});

  IconData icon;
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(text,style: TextStyle(
            fontSize: 18,color: Color(0xFF8D8E98)
        ),
        )
      ],
    );
  }
}