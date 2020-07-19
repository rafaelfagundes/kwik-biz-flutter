import 'package:flutter/material.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
import 'package:kwik_biz_flutter/utils/core_utils.dart';
import 'package:kwik_biz_flutter/utils/image_utils.dart';
import 'package:kwik_biz_flutter/utils/theme_utils.dart';
import 'package:kwik_biz_flutter/widgets/DefaultScreen/default_screen.dart';
import 'package:kwik_biz_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_biz_flutter/widgets/custom_card.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/custom_text.dart';
import 'package:kwik_biz_flutter/widgets/custom_text_field.dart';
import 'package:kwik_biz_flutter/widgets/label_and_switch_widget.dart';

class CreditCardItem {
  final bool isEnabled;
  final String id;
  final String title;
  final String url;

  CreditCardItem({
    @required this.isEnabled,
    @required this.id,
    @required this.title,
    @required this.url,
  });
}

class PaymentTypesScreen extends StatefulWidget {
  @override
  _PaymentTypesScreenState createState() => _PaymentTypesScreenState();
}

class _PaymentTypesScreenState extends State<PaymentTypesScreen> {
  List<CreditCardItem> cards = [
    CreditCardItem(
      isEnabled: false,
      id: '5dcb9e52-41f0-4e36-a3d0-25b0e31a4a83',
      title: 'Alelo',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219769/kwik/assets/img/credit_cards/alelo.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: 'd8dcc19e-09ae-4616-810f-8305431f6ec6',
      title: 'American Express',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/amex.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: 'a841e646-75b1-40a2-b961-1182893592f2',
      title: 'Aura',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/aura.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: 'f7e52f3e-8718-4fb9-ae1f-a9e0fbf09637',
      title: 'Banescard',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219767/kwik/assets/img/credit_cards/banescard.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: 'bc51b680-2772-4cf1-9ac4-f88f98d9d5b8',
      title: 'Cabal',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219765/kwik/assets/img/credit_cards/cabal.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '6ad4c569-aa07-4dd4-8321-4df97ec34eb8',
      title: 'Calcard',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/calcard.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '443f20ea-ee38-403c-91ff-d460cd12b5fd',
      title: 'Credz',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/credz.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '8902a086-7861-438c-9398-7c490a5ededb',
      title: 'Diners Club',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/dinersclub.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: 'b2baf87d-1985-4ed5-ae41-a84a9f65d1b9',
      title: 'Discover',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/discover.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '2b41e114-399b-474b-b7bd-da32c7676fd8',
      title: 'Elo',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/elo.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '45c80414-f715-4c96-a0a8-3a0a5d21629f',
      title: 'Good Card',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/goodcard.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: 'c14c9c93-2218-41ce-a49b-1450c4f40bf9',
      title: 'GreenCard',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/greencard.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '796a2bae-1e9a-409b-9053-5a18114b5311',
      title: 'Hiper',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/hiper.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '6a34f531-62a0-46d1-a269-2d6cb0ab7f8f',
      title: 'JCB',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219767/kwik/assets/img/credit_cards/jcb.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: 'dc73e15f-7dad-4593-bcc3-493ac1811a95',
      title: 'Mais',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219766/kwik/assets/img/credit_cards/mais.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '1dc47ca5-9e34-4073-8f90-0e0e14cfee01',
      title: 'Mastercard',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/mastercard.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: 'b8c3cac4-fb08-425f-b51b-bc1c0e46c229',
      title: 'MaxxCard',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219776/kwik/assets/img/credit_cards/maxxcard.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '0c2d95c4-7848-44b8-b445-96e7dc61a35b',
      title: 'Policard',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219765/kwik/assets/img/credit_cards/policard.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '450ee5ef-aee5-4690-a159-1bc3bef6b148',
      title: 'Sodexo',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/sodexo.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '51dcc29f-d57c-4a7d-b364-7c27511d956f',
      title: 'SoroCred',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219767/kwik/assets/img/credit_cards/sorocred.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: 'b489e8c4-a2c1-4e7a-9843-6680689d902c',
      title: 'Ticket',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219769/kwik/assets/img/credit_cards/ticket.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: 'f9f239dc-5701-46e6-b232-68e312c4f2cb',
      title: 'Vale Card',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/valecard.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '1762ce97-9918-4e0b-a265-22973bf6a95d',
      title: 'Vale Refeição',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219769/kwik/assets/img/credit_cards/vr.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '5acde8ad-7e79-49db-a687-16481dd5fdc6',
      title: 'Vero Card',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588219768/kwik/assets/img/credit_cards/verocard.png',
    ),
    CreditCardItem(
      isEnabled: false,
      id: '35fdfc70-0275-4591-807a-b92fe99c28a5',
      title: 'Visa',
      url:
          'https://res.cloudinary.com/kardappio/image/upload/v1588216194/kwik/assets/img/credit_cards/visa.png',
    ),
  ];

  void setCardStatus(int index, bool value) {
    List<CreditCardItem> _cards = List.from(cards);

    _cards[index] = CreditCardItem(
      isEnabled: value,
      id: _cards[index].id,
      title: _cards[index].title,
      url: _cards[index].url,
    );

    setState(() {
      cards = _cards;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScreen('Pagamento', children: [
      CustomSizedBox(heightSize: 2),
      CustomCard(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomText(
                      'Pedido Mínimo',
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      'Valor do Pedido Mínimo',
                      color: Theme.of(context).primaryColor.withOpacity(.5),
                      size: 12,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: CustomTextField(
                  labelText: 'Valor (R\$)',
                ),
              ),
            ],
          ),
        ),
      ),
      CustomSizedBox(heightSize: 2),
      CustomCard(
        child: Container(
          padding: EdgeInsets.all(16),
          child: LabelAndSwitchWidget(
            hasPadding: false,
            value: true,
            onChanged: null,
            label: 'Aceita Cupom',
            subtitle: 'Aceita cupom de desconto',
          ),
        ),
      ),
      CustomSizedBox(heightSize: 2),
      CustomCard(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: LabelAndSwitchWidget(
              value: true,
              onChanged: null,
              label: 'Aceita Dinheiro',
              subtitle: 'Aceita dinheiro em espécie',
            ),
          ),
          Divider(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: LabelAndSwitchWidget(
              value: true,
              onChanged: null,
              label: 'Aceita Cartão de Crédito',
              subtitle: 'Aceita cartão de crédito',
            ),
          ),
          Divider(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: LabelAndSwitchWidget(
              value: true,
              onChanged: null,
              label: 'Aceita Cartão de Débito',
              subtitle: 'Aceita cartão de débito',
            ),
          ),
        ],
      )),
      CustomSizedBox(heightSize: 2),
      CustomCard(
        title: 'Cartões Aceitos',
        child: Container(
            padding: EdgeInsets.all(16),
            child: Center(
                child: Column(
              children: <Widget>[
                ...cards.mapIndexed(
                  (e, index) => CardItem(
                    index: index,
                    key: ValueKey(e.id),
                    isActive: e.isEnabled,
                    onPressed: (value, index) {
                      setCardStatus(index, value);
                    },
                    cardName: e.title,
                    url: e.url,
                  ),
                )
              ],
            ))),
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

class CardItem extends StatelessWidget {
  final int index;
  final bool isActive;
  final Function onPressed;
  final String cardName;
  final String url;

  const CardItem({
    Key key,
    @required this.index,
    @required this.isActive,
    @required this.onPressed,
    @required this.cardName,
    @required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = ThemeUtils.isDark(context);

    return GestureDetector(
      onTap: () {
        onPressed(!isActive, index);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.only(left: 0, top: 10, bottom: 10, right: 16),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  Checkbox(
                      checkColor: Theme.of(context).primaryColor,
                      activeColor: Theme.of(context).accentColor,
                      value: isActive,
                      onChanged: (_) {
                        onPressed(!isActive, index);
                      }),
                  CustomText(cardName),
                ],
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(ImageUtils.resizeCloudinaryImageFromUrl(
                      url, 32, context)),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(32 / 8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
