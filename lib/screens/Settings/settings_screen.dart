import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_biz_flutter/widgets/DefaultScreen/default_screen.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/custom_text.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Ajustes',
      padding: false,
      children: <Widget>[
        CustomSizedBox(heightSize: 3),
        SettingsItem(
          onPressed: null,
          icon: SFSymbols.square_on_circle,
          title: 'Perfil do Estabelecimento',
          subtitle: 'Banner, logotipo, nome, descrição',
        ),
        Divider(
          height: 1,
          color: Colors.grey[800],
        ),
        SettingsItem(
          onPressed: null,
          icon: SFSymbols.creditcard,
          title: 'Formas de Pagamento',
          subtitle: 'Pedído mínimo e formas de pagamento',
        ),
        Divider(
          height: 1,
          color: Colors.grey[800],
        ),
        SettingsItem(
          onPressed: null,
          icon: SFSymbols.clock,
          title: 'Horário de Funcionamento',
          subtitle: 'Quando o estabelecimento está aberto',
        ),
        Divider(
          height: 1,
          color: Colors.grey[800],
        ),
        SettingsItem(
          onPressed: null,
          icon: SFSymbols.money_dollar_circle,
          title: 'Taxas de Entrega',
          subtitle: 'Valores de taxa de entrega',
        ),
        CustomSizedBox(heightSize: 2),
        SettingsItem(
          onPressed: null,
          icon: SFSymbols.person_crop_circle,
          title: 'Seu Perfil',
          subtitle: 'Avatar, nome, email, telefone',
        ),
        Divider(
          height: 1,
          color: Colors.grey[800],
        ),
        SettingsItem(
          onPressed: null,
          icon: SFSymbols.lock,
          title: 'Senha',
          subtitle: 'Altere sua senha de acesso',
        ),
      ],
    );
  }
}

class SettingsItem extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String title;
  final String subtitle;

  const SettingsItem({
    Key key,
    @required this.onPressed,
    @required this.icon,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16),
        color: Theme.of(context).cardColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon),
                CustomSizedBox(widthSize: 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(title),
                    SizedBox(height: 2),
                    CustomText(
                      subtitle,
                      color: Theme.of(context).primaryColor.withOpacity(.5),
                    ),
                  ],
                )
              ],
            ),
            Icon(
              SFSymbols.chevron_right,
              size: 16,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
