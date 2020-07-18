import 'package:flutter/material.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
import 'package:kwik_biz_flutter/utils/image_utils.dart';
import 'package:kwik_biz_flutter/utils/theme_utils.dart';
import 'package:kwik_biz_flutter/widgets/DefaultScreen/default_screen.dart';
import 'package:kwik_biz_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_biz_flutter/widgets/custom_card.dart';
import 'package:kwik_biz_flutter/widgets/custom_multiline_text_field.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/custom_text_field.dart';
import 'package:kwik_biz_flutter/widgets/rounded_store_logo_widget.dart';

class BizProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width - 32;
    double logoSize = 96;
    var isDark = ThemeUtils.isDark(context);

    return DefaultScreen('Boston Burger Co.', children: [
      CustomSizedBox(heightSize: 1),
      CustomCard(
        child: Column(
          children: <Widget>[
            Container(
              width: size,
              height: size * 0.625,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    ImageUtils.resizeCloudinaryImageFromUrl(
                        'https://res.cloudinary.com/kardappio/image/upload/v1593736995/dan-gold-E6HjQaB7UEA-unsplash_1.jpg',
                        size.toInt(),
                        context),
                  ),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: size,
                    height: size * 0.625,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.45),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Container(
                        width: logoSize,
                        height: logoSize,
                        child: RoundedStoreLogoWidget(
                            size: logoSize,
                            url: ImageUtils.resizeCloudinaryImageFromUrl(
                                'https://res.cloudinary.com/kardappio/image/upload/v1588298907/tyukddlp3acv7fhicrvj.png',
                                logoSize.toInt(),
                                context)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomButtonWidget(
                    buttonFillType: ButtonFillType.EMPTY,
                    buttonType: ButtonType.DEFAULT_ALTERNATIVE,
                    buttonText: 'Editar Logo'.toUpperCase(),
                  ),
                ),
                Container(
                  width: 1,
                  height: 45,
                  color: Colors.grey[isDark ? 800 : 100],
                ),
                Expanded(
                  child: CustomButtonWidget(
                    buttonFillType: ButtonFillType.EMPTY,
                    buttonType: ButtonType.DEFAULT_ALTERNATIVE,
                    buttonText: 'Editar Banner'.toUpperCase(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      CustomSizedBox(heightSize: 3),
      CustomCard(
        title: 'Dados do Estabelecimento',
        child: Container(
          width: size,
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              CustomTextField(
                labelText: 'Nome da Empresa',
              ),
              CustomSizedBox(
                heightSize: 2,
              ),
              CustomMultilineTextField(labelText: 'Descrição'),
              CustomSizedBox(
                heightSize: 2,
              ),
              CustomTextField(
                labelText: 'Telefone',
              ),
              CustomSizedBox(
                heightSize: 2,
              ),
              CustomTextField(
                labelText: 'Email',
              ),
              CustomSizedBox(
                heightSize: 1,
              ),
            ],
          ),
        ),
      ),
      CustomSizedBox(heightSize: 3),
      CustomButtonWidget(
        buttonType: ButtonType.CONFIRMATION,
        buttonText: 'Salvar',
        onPressed: null,
      ),
    ]);
  }
}
