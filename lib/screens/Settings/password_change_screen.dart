import 'package:flutter/material.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
import 'package:kwik_biz_flutter/widgets/DefaultScreen/default_screen.dart';
import 'package:kwik_biz_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_biz_flutter/widgets/custom_card.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/custom_text_field.dart';

class PasswordChangeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultScreen('Senha', children: [
      CustomSizedBox(heightSize: 2),
      CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomTextField(
            labelText: 'Senha Atual',
          ),
        ),
        title: 'Senha Atual',
      ),
      CustomSizedBox(heightSize: 2),
      CustomCard(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              CustomTextField(
                labelText: 'Nova Senha',
              ),
              CustomSizedBox(heightSize: 2),
              CustomTextField(
                labelText: 'Confirmar Nova Senha',
              ),
            ],
          ),
        ),
        title: 'Nova Senha',
      ),
      CustomSizedBox(heightSize: 3),
      CustomButtonWidget(
        buttonType: ButtonType.CALL_TO_ACTION_ALTERNATIVE,
        buttonText: 'Alterar Senha',
        onPressed: null,
      ),
    ]);
  }
}
