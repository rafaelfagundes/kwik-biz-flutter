import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as Material;

class CustomAlertDialog {
  static void showDialog(BuildContext context,
      {@required String title, @required String content}) {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(
                title,
                style: TextStyle(
                    fontFamily: 'Lato',
                    color: Material.Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              content: Text(
                '\n' + content,
                style: TextStyle(
                    fontFamily: 'Lato',
                    color: Material.Theme.of(context).primaryColor,
                    fontWeight: FontWeight.normal),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(
                    'OK',
                    style: TextStyle(
                        fontFamily: 'Lato', fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    } else if (Platform.isAndroid) {
      Material.showDialog(
        context: context,
        builder: (BuildContext context) {
          return Material.AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                  fontFamily: 'Lato',
                  color: Material.Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
              content,
              style: TextStyle(
                  fontFamily: 'Lato',
                  color: Material.Theme.of(context).primaryColor,
                  fontWeight: FontWeight.normal),
            ),
            actions: <Widget>[
              Material.FlatButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                      fontFamily: 'Lato', fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
