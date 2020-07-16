import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:intl/intl.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
import 'package:kwik_biz_flutter/utils/theme_utils.dart';
import 'package:kwik_biz_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_biz_flutter/widgets/custom_card.dart';
import 'package:kwik_biz_flutter/widgets/custom_secondary_text.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/custom_text.dart';
import 'package:kwik_biz_flutter/widgets/label_and_switch_widget.dart';
import 'package:kwik_biz_flutter/widgets/rounded_store_logo_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool showStatusDrawer = false;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showHideControls() {
    setState(() {
      showStatusDrawer = !showStatusDrawer;
      if (showStatusDrawer) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            HomeHeader('Rafael Fagundes'),
            CustomSizedBox(heightSize: 2),
            BusinessStatus(
                controller: _controller,
                showHideControls: _showHideControls,
                showStatusDrawer: showStatusDrawer),
            CustomSizedBox(heightSize: 2),
            CustomCard(
              child: DualValueCard(
                value1value: '64',
                value1label: 'Pedidos Abertos',
                value2value: '88',
                value2label: 'Pedidos de Hoje',
                onPressed: null,
                buttonText: 'Ver Pedidos',
              ),
            ),
            CustomSizedBox(heightSize: 2),
            CustomCard(
              child: DualValueCard(
                value1value: '35 min',
                value1label: 'Média de Entrega',
                value2value: '15 min',
                value2label: 'Média de Retirada',
                onPressed: null,
                buttonText: 'Alterar',
              ),
            ),
            CustomSizedBox(heightSize: 2),
            CustomCard(
              child: DualValueCard(
                value1value: '3.4',
                value1label: '5 avaliações',
                value1icon: SFSymbols.star_fill,
                value1color: Colors.yellow[700],
                value2value: '6',
                value2label: 'Favoritos',
                value2icon: SFSymbols.heart_fill,
                value2color: Colors.red[900],
                onPressed: null,
                buttonText: 'Ver Avaliações',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BusinessStatus extends StatelessWidget {
  final Function showHideControls;
  final bool showStatusDrawer;

  const BusinessStatus({
    Key key,
    @required AnimationController controller,
    @required this.showHideControls,
    @required this.showStatusDrawer,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomCard(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.only(left: 16, right: 6, bottom: 16, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          RoundedStoreLogoWidget(
                            size: 46,
                            url:
                                'https://res.cloudinary.com/kardappio/image/upload/v1588298907/tyukddlp3acv7fhicrvj.png',
                          ),
                          CustomSizedBox(widthSize: 1.5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CustomText('Estabelecimento Aberto',
                                  weight: FontWeight.bold,
                                  size: 16,
                                  color: Colors.green[500]),
                              SizedBox(height: 3),
                              CustomText(
                                'Entregando e aceitando retirada',
                                color: Colors.grey,
                                size: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: Container(
                            width: 42,
                            height: 42,
                            color: Colors.transparent,
                            child: Icon(
                              SFSymbols.slider_horizontal_3,
                              color: showStatusDrawer
                                  ? Theme.of(context).accentColor
                                  : Theme.of(context).primaryColor,
                            )),
                        onTap: showHideControls,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    color: Colors.green[600],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: CurvedAnimation(
            curve: Curves.easeInOut,
            parent: _controller,
          ),
          child: Container(
            height: 181,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomCard(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16),
                  LabelAndSwitchWidget(
                    value: true,
                    onChanged: null,
                    label: 'Entregando',
                  ),
                  SizedBox(height: 10),
                  LabelAndSwitchWidget(
                    value: true,
                    onChanged: null,
                    label: 'Aceitando Retirada',
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: CustomButtonWidget(
                      buttonText: 'Fechar Estabelecimento',
                      buttonType: ButtonType.CANCEL,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DualValueCard extends StatelessWidget {
  final String value1label;
  final String value1value;
  final IconData value1icon;
  final Color value1color;
  final String value2label;
  final String value2value;
  final IconData value2icon;
  final Color value2color;
  final Function onPressed;
  final String buttonText;

  const DualValueCard({
    Key key,
    @required this.value1label,
    @required this.value1value,
    this.value1icon,
    this.value1color,
    // --
    @required this.value2label,
    @required this.value2value,
    this.value2icon,
    this.value2color,
    // --
    @required this.onPressed,
    @required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (value1icon != null)
                    Container(
                        child: Icon(value1icon),
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: value1color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(64)))),
                  Column(
                    crossAxisAlignment: value1icon == null
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomText(
                        value1value,
                        size: 20,
                      ),
                      SizedBox(height: 2),
                      CustomText(
                        value1label,
                        color: Colors.grey,
                        size: 12,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 68,
              width: 0.5,
              color: Colors.grey[isDark ? 800 : 200],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (value2icon != null)
                    Container(
                        child: Icon(value2icon),
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: value2color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(64)))),
                  Column(
                    crossAxisAlignment: value2icon == null
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomText(
                        value2value,
                        size: 20,
                      ),
                      SizedBox(height: 2),
                      CustomText(
                        value2label,
                        color: Colors.grey,
                        size: 12,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Divider(
          height: 1,
          color: Colors.grey[isDark ? 800 : 200],
        ),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: EdgeInsets.all(10),
            child: CustomText(buttonText),
          ),
        ),
      ],
    );
  }
}

class HomeHeader extends StatelessWidget {
  final String name;

  const HomeHeader(
    this.name, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date0 = DateFormat('EEE, d').format(DateTime.now());
    var date1 = DateFormat('MMMM, yyyy').format(DateTime.now());
    var date = date0 + ' de ' + date1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomText(
          'Bem vindo,',
        ),
        SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomSecondaryText(
              name,
              color: Theme.of(context).accentColor,
            ),
            CustomText(
              date,
              color: Colors.grey,
              size: 12,
            )
          ],
        )
      ],
    );
  }
}
