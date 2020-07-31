import 'package:flutter/material.dart';
import 'package:kwik_biz_flutter/utils/theme_utils.dart';
import 'package:kwik_biz_flutter/widgets/custom_text.dart';

class ReadLabel extends StatelessWidget {
  final bool isRead;
  final double size;

  const ReadLabel({
    Key key,
    @required this.isRead,
    this.size = 10,
  }) : super(key: key);

  Map<String, dynamic> _getStatusTextAndColor(bool isDark) {
    switch (this.isRead) {
      case true:
        return {
          "text": "Não Lida",
          "color": Colors.lightBlue,
        };
      case false:
        return {
          "text": "Lida",
          "color": Colors.grey[isDark ? 800 : 300],
        };

      default:
        return {
          "text": "Novo",
          "color": Colors.lightBlue[isDark ? 800 : 300],
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    Map<String, dynamic> statusTextAndColor = _getStatusTextAndColor(isDark);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: size * 0.8),
      height: size * 1.6,
      decoration: BoxDecoration(
        color: statusTextAndColor['color'],
        borderRadius: BorderRadius.all(
          Radius.circular(size * 0.4),
        ),
      ),
      child: Center(
        child: CustomText(
          statusTextAndColor['text'],
          color: Colors.white,
          size: size,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}
