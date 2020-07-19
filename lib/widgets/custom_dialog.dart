import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as Material;

class CustomDialog {
  static void showDialog(
    BuildContext context, {
    @required String title,
    @required Widget content,
    bool hasOkButton = true,
  }) {
    if (Platform.isIOS) {
      showCupertinoDialog(
          useRootNavigator: true,
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
              content: content,
              actions: hasOkButton
                  ? <Widget>[
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
                    ]
                  : [],
            );
          });
    } else if (Platform.isAndroid) {
      Material.showDialog(
        useRootNavigator: true,
        // barrierDismissible: false, // user must tap button!
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
            content: content,
            actions: hasOkButton
                ? <Widget>[
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
                  ]
                : [],
          );
        },
      );
    }
  }
}
