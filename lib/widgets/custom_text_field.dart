import 'package:flutter/material.dart';
import 'package:kwik_biz_flutter/utils/theme_utils.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String helperText;
  final String errorText;
  final Function onChanged;
  final TextInputAction textInputAction;
  final Function onEditingComplete;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final bool autocorrect;
  final bool obscureText;
  final TextInputType keyboardType;

  const CustomTextField({
    Key key,
    this.labelText,
    this.helperText,
    this.errorText,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
    this.onEditingComplete,
    this.controller,
    this.textCapitalization = TextCapitalization.sentences,
    this.autocorrect = true,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 4),
              color: Colors.black.withOpacity(0.05))
        ],
      ),
      child: TextField(
        autocorrect: autocorrect,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: isDark ? Color(0xff161616) : Colors.white,
          border: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          labelText: labelText,
          helperText: helperText,
          errorText: errorText,
          helperStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontFamily: 'Lato',
            fontSize: 11,
          ),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        style: TextStyle(fontFamily: 'Lato'),
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
      ),
    );
  }
}
