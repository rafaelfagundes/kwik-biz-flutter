import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class LabelAndSwitchWidget extends StatelessWidget {
  final bool value;
  final String label;
  final String subtitle;
  final Function onChanged;
  final bool hasPadding;

  const LabelAndSwitchWidget({
    Key key,
    @required this.value,
    @required this.onChanged,
    @required this.label,
    this.subtitle,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              if (subtitle != null)
                Column(
                  children: <Widget>[
                    SizedBox(height: 5),
                    CustomText(
                      subtitle,
                      color: Theme.of(context).primaryColor.withOpacity(.5),
                      size: 12,
                    ),
                  ],
                )
            ],
          ),
          if (Platform.isAndroid) Switch(value: value, onChanged: onChanged),
          if (Platform.isIOS)
            CupertinoSwitch(value: value, onChanged: onChanged)
        ],
      ),
    );
  }
}
