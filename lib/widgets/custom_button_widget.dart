import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';

class CustomButtonWidget extends StatefulWidget {
  final String buttonText;
  final IconData icon;
  final Function onPressed;
  final ButtonType buttonType;
  final ButtonFillType buttonFillType;
  final double verticalIconAjustment;
  final bool iconOnRight;

  const CustomButtonWidget({
    Key key,
    this.buttonText,
    this.onPressed,
    this.icon,
    this.buttonType = ButtonType.DEFAULT,
    this.buttonFillType = ButtonFillType.FILLED,
    this.verticalIconAjustment = -1,
    this.iconOnRight = false,
  }) : super(key: key);

  @override
  _CustomButtonWidgetState createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget>
    with SingleTickerProviderStateMixin {
  double buttonHeight = 45.0;
  double buttonMargin = 0.0;
  double buttonFontSize = 14;
  double buttonIconSize = 22;
  double buttonSpacer = 5;
  Color shadowColor = Colors.black12;
  double topPosition;

  @override
  void initState() {
    super.initState();
    topPosition = widget.verticalIconAjustment;
  }

  List<Color> _getColors(bool isDark, ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.DEFAULT:
        return isDark
            ? [Color(0xff920492), Color(0xff6B026B)]
            : [Color(0xff800080), Color(0xff440044)];
      case ButtonType.DEFAULT_ALTERNATIVE:
        return isDark
            ? [Color(0xffFFFFFF), Color(0xffD6D6D6)]
            : [Color(0xff800080), Color(0xff440044)];
      case ButtonType.CONFIRMATION:
        return [Color(0xff19C89C), Color(0xff17B890)];
      case ButtonType.CANCEL:
        return [Color(0xffE84A4D), Color(0xffCF3538)];
      case ButtonType.CALL_TO_ACTION:
        return [Color(0xffFE7868), Color(0xffEE6352)];
      case ButtonType.CALL_TO_ACTION_ALTERNATIVE:
        return [Color(0xff41ABFF), Color(0xff008BF8)];
      case ButtonType.DISABLED:
        return [Color(0xffa28f9d), Color(0xffb5a6b1)];
      default:
        return [Color(0xff800080), Color(0xff440044)];
    }
  }

  BoxDecoration _getDecoration(
      bool isDark, ButtonType buttonType, ButtonFillType buttonFillType) {
    var colors = _getColors(isDark, buttonType);

    switch (buttonFillType) {
      case ButtonFillType.BORDER:
        return BoxDecoration(
          border: Border.all(color: colors[0], width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        );
      case ButtonFillType.EMPTY:
        return BoxDecoration();
      case ButtonFillType.FILLED:
        return BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: Offset(0, 2),
              color: colors[0].withOpacity(.35),
            )
          ],
        );
      default:
        return BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        );
    }
  }

  Color _getFontColor(
      bool isDark, ButtonType buttonType, ButtonFillType buttonFillType) {
    var colors = _getColors(isDark, buttonType);

    switch (buttonFillType) {
      case ButtonFillType.FILLED:
        return Colors.white;
      default:
        return isDark ? colors[1] : colors[0];
    }
  }

  void _buttonPressed() {
    setState(() {
      buttonHeight = 45 * 0.8;
      buttonMargin = (45 - 45 * 0.8);
      buttonFontSize = 14 * 0.8;
      buttonIconSize = 22 * 0.8;
      buttonSpacer = 5 * 0.8;
      topPosition = widget.verticalIconAjustment * 1.5;
    });
  }

  void _buttonReleased() {
    setState(() {
      buttonHeight = 45;
      buttonMargin = 0;
      buttonFontSize = 14;
      buttonIconSize = 22;
      buttonSpacer = 5;
      topPosition = widget.verticalIconAjustment;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness.toString() == "Brightness.dark";

    var fontColor =
        _getFontColor(isDark, widget.buttonType, widget.buttonFillType);

    var buttonDecoration =
        _getDecoration(isDark, widget.buttonType, widget.buttonFillType);

    return GestureDetector(
      onTapDown: (_) {
        _buttonPressed();
      },
      onTapUp: (_) {
        _buttonReleased();
      },
      onTapCancel: () {
        _buttonReleased();
      },
      onTap: () {
        widget.onPressed();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        curve: Curves.linear,
        height: buttonHeight,
        margin: EdgeInsets.only(
          left: buttonMargin,
          right: buttonMargin,
          bottom: buttonMargin / 2,
          top: buttonMargin / 2,
        ),
        decoration: buttonDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (widget.icon != null && widget.iconOnRight == false)
              AnimatedContainer(
                curve: Curves.linear,
                duration: Duration(milliseconds: 50),
                width: buttonIconSize + buttonSpacer,
                height: buttonIconSize,
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    AnimatedPositioned(
                      curve: Curves.linear,
                      top: topPosition,
                      duration: Duration(milliseconds: 50),
                      width: buttonIconSize + buttonSpacer,
                      height: buttonIconSize,
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return Icon(
                            widget.icon,
                            size: constraint.biggest.height,
                            color: fontColor,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            if (widget.buttonText != null)
              AnimatedDefaultTextStyle(
                style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w600,
                  fontSize: buttonFontSize,
                  color: fontColor,
                ),
                duration: const Duration(milliseconds: 50),
                curve: Curves.linear,
                child: Text(
                  widget.buttonText,
                ),
              ),
            if (widget.icon != null && widget.iconOnRight)
              AnimatedContainer(
                curve: Curves.linear,
                duration: Duration(milliseconds: 50),
                width: buttonIconSize,
                height: buttonIconSize,
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    AnimatedPositioned(
                      curve: Curves.linear,
                      top: topPosition,
                      right: -5,
                      duration: Duration(milliseconds: 50),
                      width: buttonIconSize,
                      height: buttonIconSize,
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return Icon(widget.icon,
                              size: constraint.biggest.height,
                              color: fontColor);
                        },
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
