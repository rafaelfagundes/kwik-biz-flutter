import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_biz_flutter/modules/cart_item/cart_item_model.dart';
import 'package:kwik_biz_flutter/modules/orders/order_model.dart';
import 'package:kwik_biz_flutter/screen_arguments/order_details_args.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
import 'package:kwik_biz_flutter/utils/currency_utils.dart';
import 'package:kwik_biz_flutter/widgets/DefaultScreen/default_screen.dart';
import 'package:kwik_biz_flutter/widgets/custom_button_widget.dart';
import 'package:kwik_biz_flutter/widgets/custom_card.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/custom_text.dart';
import 'package:kwik_biz_flutter/widgets/rounded_avatar_widget.dart';
import 'package:kwik_biz_flutter/widgets/status_label_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrderDetailsArguments args =
        ModalRoute.of(context).settings.arguments;
    final Order order = args.order;
    inspect(order);

    Widget _getButtons(OrderStatusType status, DeliveryType deliveryType) {
      switch (status) {
        case OrderStatusType.OPEN:
          return Column(
            children: <Widget>[
              CustomButtonWidget(
                buttonFillType: ButtonFillType.FILLED,
                buttonType: ButtonType.CONFIRMATION,
                buttonText: 'Confirmar Pedido',
              ),
              CustomSizedBox(heightSize: 2),
              CustomButtonWidget(
                buttonFillType: ButtonFillType.EMPTY,
                buttonType: ButtonType.CANCEL,
                buttonText: 'Cancelar Pedido',
              )
            ],
          );
        case OrderStatusType.CONFIRMED:
          return Column(
            children: <Widget>[
              CustomButtonWidget(
                buttonFillType: ButtonFillType.FILLED,
                buttonType: ButtonType.CALL_TO_ACTION_ALTERNATIVE,
                buttonText: deliveryType == DeliveryType.DELIVERY
                    ? 'Saiu Para Entrega'
                    : 'Pedido Pronto Para Retirada',
              ),
              CustomSizedBox(heightSize: 2),
              CustomButtonWidget(
                buttonFillType: ButtonFillType.EMPTY,
                buttonType: ButtonType.CANCEL,
                buttonText: 'Cancelar Pedido',
              )
            ],
          );

        case OrderStatusType.CANCELED_BY_STORE:
          return SizedBox();
        case OrderStatusType.CANCELED_BY_USER:
          return SizedBox();
        case OrderStatusType.DELIVERED:
          return SizedBox();
        case OrderStatusType.EXPIRED:
          return SizedBox();

        default:
          return Column(
            children: <Widget>[
              CustomButtonWidget(
                buttonFillType: ButtonFillType.FILLED,
                // buttonType: ButtonType.CALL_TO_ACTION_ALTERNATIVE,
                buttonText: 'Pedido Entregue',
              ),
              CustomSizedBox(heightSize: 2),
              CustomButtonWidget(
                buttonFillType: ButtonFillType.EMPTY,
                buttonType: ButtonType.CANCEL,
                buttonText: 'Cancelar Pedido',
              )
            ],
          );
      }
    }

    return DefaultScreen(
      'Detalhes do Pedido',
      children: [
        UserData(order: order),
        CustomSizedBox(heightSize: 2),
        OrderData(order: order),
        CustomSizedBox(heightSize: 2),
        CustomCard(
            child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    'Itens do Pedido',
                    size: 18,
                  ),
                ],
              ),
              CustomSizedBox(heightSize: 1.5),
              ...order.items.map((e) => OrderItem(cartItem: e)),
              CustomSizedBox(heightSize: 1),
              Divider(),
              CustomSizedBox(heightSize: 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText('Valor dos Itens'),
                  CustomText(CurrencyUtils.toBRL(order.itemsValue)),
                ],
              ),
              CustomSizedBox(heightSize: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText('Valor do Frete'),
                  CustomText(CurrencyUtils.toBRL(order.deliveryFee)),
                ],
              ),
              if (order.discountAmount > 0)
                Column(
                  children: <Widget>[
                    CustomSizedBox(heightSize: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CustomText('Cupom'),
                            CustomSizedBox(widthSize: .5),
                            CustomText(
                              '#${order.coupon}',
                              size: 10,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.5),
                              height: 1.7,
                            ),
                          ],
                        ),
                        CustomText(
                            '-${CurrencyUtils.toBRL(order.discountAmount)}'),
                      ],
                    ),
                  ],
                ),
              CustomSizedBox(heightSize: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText('VALOR TOTAL', color: Color(0xff19C89C)),
                  CustomText(CurrencyUtils.toBRL(order.discountAmount),
                      color: Color(0xff19C89C)),
                ],
              ),
            ],
          ),
        )),
        CustomSizedBox(heightSize: 4),
        _getButtons(order.status, order.deliveryType)
      ],
    );
  }
}

class OrderItem extends StatelessWidget {
  final CartItem cartItem;

  const OrderItem({
    Key key,
    @required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Center(
                      child: CustomText(
                    cartItem.qty.toString(),
                    weight: FontWeight.bold,
                    size: 12,
                    color: Color(0xff121212),
                    height: 1.1,
                  )),
                ),
                CustomSizedBox(widthSize: 0.75),
                CustomText(cartItem.title)
              ],
            ),
            CustomText(
              NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                  .format(cartItem.value),
            ),
          ],
        ),
        if (cartItem.addons != null) CustomSizedBox(heightSize: 0.5),
        if (cartItem.addons == null) CustomSizedBox(heightSize: 1),
        if (cartItem.addons != null)
          ...cartItem.addons.map(
            (e) => Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CustomSizedBox(widthSize: 1),
                        CustomText('+', color: Theme.of(context).primaryColor),
                        CustomSizedBox(widthSize: 0.5),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: Center(
                              child: CustomText(
                            e.qty.toString(),
                            weight: FontWeight.bold,
                            size: 10,
                            color: Theme.of(context).primaryColor,
                            height: 1.1,
                          )),
                        ),
                        CustomSizedBox(widthSize: 0.75),
                        CustomText(e.title)
                      ],
                    ),
                    CustomText(
                      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                          .format(e.value),
                    ),
                  ],
                ),
                CustomSizedBox(heightSize: 0.5),
              ],
            ),
          )
      ],
    );
  }
}

class OrderData extends StatelessWidget {
  const OrderData({
    Key key,
    @required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomText(
                  'Dados do Pedido',
                  size: 18,
                ),
                StatusLabel(status: order.status, size: 12)
              ],
            ),
            CustomSizedBox(heightSize: 1.5),
            TableItem(
              label: 'ID do Pedido',
              value: order.friendlyId,
            ),
            CustomSizedBox(heightSize: 1),
            TableItem(
              label: 'Forma de Entrega',
              value: order.deliveryType == DeliveryType.DELIVERY
                  ? 'Entregar ao Cliente'
                  : 'Retirada no Balcão',
            ),
            CustomSizedBox(heightSize: 1),
            TableItem(
              label: 'Forma de Pagamento',
              value: order.paymentType == PaymentType.CARD
                  ? 'Cartão de Déb./Créd.'
                  : 'Dinheiro',
            ),
          ],
        ),
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData({
    Key key,
    @required this.order,
  }) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CustomText(
                  '${order.userDataOnOrder['firstName']} ${order.userDataOnOrder['lastName']}',
                  size: 18,
                ),
                CustomSizedBox(heightSize: 1),
                CustomText(
                  DateFormat('dd/MM/yyyy HH:mm:ss').format(order.createdAt),
                  color: Theme.of(context).primaryColor.withOpacity(.6),
                  size: 12,
                ),
              ],
            ),
            RoundedAvatarWidget(url: order?.user?.image, size: 56)
          ],
        ),
      ),
    );
  }
}

class TableItem extends StatelessWidget {
  final String label;
  final String value;

  const TableItem({
    Key key,
    @required this.label,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomText(
          label,
          color: Theme.of(context).primaryColor.withOpacity(.5),
          size: 12,
        ),
        CustomText(value),
      ],
    );
  }
}
