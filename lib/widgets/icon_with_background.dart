import 'package:flutter/material.dart';

class IconWithBackground extends StatelessWidget {
  const IconWithBackground({
    Key key,
    @required this.icon,
    @required this.color,
    this.size = 48,
    this.margin = 0,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final double size;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: size * 0.25,
          left: size * 0.209,
          child: Container(
            color: Colors.white,
            width: size * 0.583,
            height: size * 0.583,
          ),
        ),
        Container(
          child: Icon(icon, color: color, size: size),
          margin: EdgeInsets.only(right: margin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(size / 2),
            ),
          ),
        ),
      ],
    );
  }
}
