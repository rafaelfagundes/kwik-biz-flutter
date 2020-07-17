import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';

import '../custom_secondary_text.dart';

class DefaultScreen extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final bool padding;

  const DefaultScreen(this.title,
      {Key key, @required this.children, this.padding = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 16),
              width: 64,
              height: 64,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    SFSymbols.arrow_left,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                ],
              ),
            ),
          );
        }),
        title: CustomSecondaryText(
          title,
          weight: FontWeight.normal,
          size: 18,
        ),
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 16),
              width: 64,
              height: 64,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    SFSymbols.bell_fill,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding ? 16.0 : 0),
          child: Column(children: <Widget>[
            ...children,
            CustomSizedBox(heightSize: 3),
          ]),
        ),
      ),
    );
  }
}
