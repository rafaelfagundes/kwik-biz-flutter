import 'package:flutter/material.dart';

class CustomSecondaryText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;

  const CustomSecondaryText(
    this.text, {
    Key key,
    this.size = 18,
    this.weight = FontWeight.bold,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Sen',
        fontSize: size,
        color: color != null ? color : Theme.of(context).primaryColor,
        fontWeight: weight,
      ),
    );
  }
}
