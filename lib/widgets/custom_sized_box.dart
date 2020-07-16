import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double widthSize;
  final double heightSize;

  const CustomSizedBox({
    Key key,
    this.widthSize = 1,
    this.heightSize = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8 * heightSize,
      width: 8 * widthSize,
    );
  }
}
