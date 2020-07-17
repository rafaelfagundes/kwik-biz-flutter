import 'package:flutter/material.dart';
import 'package:kwik_biz_flutter/widgets/custom_text.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final String title;

  const CustomCard({Key key, @required this.child, this.title})
      : super(key: key);

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
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (title != null)
            Container(
              padding: EdgeInsets.only(top: 16, left: 16, bottom: 10),
              child: CustomText(
                title.toUpperCase(),
                size: 12,
                weight: FontWeight.bold,
              ),
            ),
          child,
        ],
      )),
    );
  }
}
