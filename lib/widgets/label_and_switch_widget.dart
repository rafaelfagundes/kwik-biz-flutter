import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LabelAndSwitchWidget extends StatelessWidget {
  final bool value;
  final String label;
  final Function onChanged;
  final bool hasPadding;

  const LabelAndSwitchWidget({
    Key key,
    @required this.value,
    @required this.onChanged,
    @required this.label,
    this.hasPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: hasPadding
          ? const EdgeInsets.symmetric(horizontal: 16)
          : EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColor,
            ),
          ),
          if (Platform.isAndroid) Switch(value: value, onChanged: onChanged),
          if (Platform.isIOS)
            CupertinoSwitch(value: value, onChanged: onChanged)
        ],
      ),
    );
  }
}
