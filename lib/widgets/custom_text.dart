import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;

  const CustomText(
    this.text, {
    Key key,
    this.size = 14,
    this.weight = FontWeight.normal,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Lato',
        fontSize: size,
        color: color != null ? color : Theme.of(context).primaryColor,
        fontWeight: weight,
      ),
    );
  }
}
