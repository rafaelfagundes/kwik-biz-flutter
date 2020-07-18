import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
import 'package:kwik_biz_flutter/utils/image_utils.dart';
import 'package:kwik_biz_flutter/utils/theme_utils.dart';
import 'package:kwik_biz_flutter/widgets/DefaultScreen/default_screen.dart';
import 'package:kwik_biz_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_biz_flutter/widgets/custom_card.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/custom_text.dart';
import 'package:kwik_biz_flutter/widgets/custom_text_field.dart';
import 'package:kwik_biz_flutter/widgets/rounded_avatar_widget.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var isDark = ThemeUtils.isDark(context);

    return DefaultScreen('Rafael Fagundes', children: [
      CustomSizedBox(heightSize: 2),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 96,
        child: Center(
          child: Stack(
            children: <Widget>[
              RoundedAvatarWidget(
                size: 96,
                url: ImageUtils.resizeCloudinaryImageFromUrl(
                  'https://res.cloudinary.com/kardappio/image/upload/v1594086607/IMG_2013_exported_642585348.jpg',
                  96,
                  context,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Icon(SFSymbols.ellipsis,
                        color: Color(0xff440044), size: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      CustomSizedBox(heightSize: 3),
      CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              CustomTextField(labelText: 'Nome'),
              CustomSizedBox(heightSize: 2),
              CustomTextField(labelText: 'Sobrenome'),
              CustomSizedBox(heightSize: 2),
              CustomTextField(labelText: 'Sexo'),
              CustomSizedBox(heightSize: 2),
              CustomTextField(labelText: 'Data de Nascimento'),
            ],
          ),
        ),
        title: 'Dados Pessoais',
      ),
      CustomSizedBox(heightSize: 2),
      CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              CustomTextField(labelText: 'Email'),
              CustomSizedBox(heightSize: 2),
              Container(
                child: CustomText(
                  'Caso queira alterar o email, entre em contato conosco',
                  color: Colors.grey[isDark ? 600 : 500],
                  size: 12,
                ),
              ),
              CustomSizedBox(heightSize: 2),
              CustomTextField(labelText: 'Número de Celular'),
            ],
          ),
        ),
        title: 'Contato',
      ),
      CustomSizedBox(heightSize: 3),
      CustomButtonWidget(
        buttonType: ButtonType.CALL_TO_ACTION_ALTERNATIVE,
        buttonText: 'Salvar',
        onPressed: null,
      ),
    ]);
  }
}
