import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_biz_flutter/utils/theme_utils.dart';

import '../custom_text.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> options;
  final String value;
  final Function setValue;

  const CustomDropdownButton({
    Key key,
    @required this.value,
    @required this.setValue,
    @required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return Container(
      height: 58,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? Color(0xff161616) : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 4),
              color: Colors.black.withOpacity(0.05))
        ],
      ),
      child: Center(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value.toString(),
          icon: Icon(SFSymbols.chevron_down,
              color: Theme.of(context).primaryColor.withOpacity(.5)),
          iconSize: 18,
          elevation: 16,
          style: TextStyle(color: Theme.of(context).primaryColor),
          underline: SizedBox(height: 0),
          onChanged: (String newValue) {
            setValue(newValue);
          },
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: CustomText(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
