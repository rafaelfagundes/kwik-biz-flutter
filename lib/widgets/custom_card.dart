import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 4),
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Container(child: child),
    );
  }
}
