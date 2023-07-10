import 'package:flutter/material.dart';
import 'ChildCards.dart';

class NewCard extends StatelessWidget {

  NewCard({required this.colour,required this.childcard});

  Color colour;
  Widget childcard;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: childcard,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}