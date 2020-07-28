import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_biz_flutter/modules/cart_item/cart_item_model.dart';
import 'package:kwik_biz_flutter/modules/item_addon/item_addon_model.dart';
import 'package:kwik_biz_flutter/modules/orders/order_model.dart';
import 'package:kwik_biz_flutter/screen_arguments/order_details_args.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
import 'package:kwik_biz_flutter/widgets/custom_card.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/custom_text.dart';
import 'package:kwik_biz_flutter/widgets/slide_switch_widget.dart';
import 'package:kwik_biz_flutter/widgets/status_label_widget.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String option = 'novos';

  @override
  Widget build(BuildContext context) {
    List<Order> orders = [
      Order(
        id: 'd3e65ca1-7d81-4687-9352-0279dce7c3e6',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        friendlyId: '#1A7J8O4D23',
        userDataOnOrder: {
          "firstName": "Rafael",
          "lastName": "Fagundes",
          "address": {
            "complement": "",
            "city": "São João del Rei",
            "houseNumber": "150",
            "latitude": "-21.139510",
            "longitude": "-44.262767",
            "neighbourhood": "Guarda-Mor",
            "state": "MG",
            "street": "Rua Frederico Ozanan",
          }
        },
        status: OrderStatusType.OPEN,
        paymentType: PaymentType.CARD,
        deliveryType: DeliveryType.DELIVERY,
        items: [
          CartItem(qty: 1, title: 'Big Mac - Light', value: 17.9),
          CartItem(
            qty: 1,
            title: 'X-Frango',
            value: 12.9,
            addons: [
              ItemAddon(qty: 1, title: 'Bacon', value: 4),
              ItemAddon(qty: 1, title: 'Picles', value: 3),
              ItemAddon(qty: 1, title: 'Cebola Caramelizada', value: 2.5),
            ],
          )
        ],
        orderShortDescription: '1x Dogão, 1x Coca-Cola 350ml',
        deliveryFee: 5.00,
        itemsValue: 20,
        finalPrice: 25.00,
        user: null,
        discountAmount: 5,
        coupon: 'SEUMADRUGA',
      ),
      Order(
        id: 'e0fc3791-1f4e-4b99-b045-74c7374bb990',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        friendlyId: '#1A7J8O4D23',
        userDataOnOrder: {
          "firstName": "Rafael",
          "lastName": "Fagundes",
          "address": {
            "complement": "",
            "city": "São João del Rei",
            "houseNumber": "150",
            "latitude": "-21.139510",
            "longitude": "-44.262767",
            "neighbourhood": "Guarda-Mor",
            "state": "MG",
            "street": "Rua Frederico Ozanan",
          }
        },
        status: OrderStatusType.CONFIRMED,
        paymentType: PaymentType.CASH,
        deliveryType: DeliveryType.PICKUP,
        items: [
          CartItem(qty: 1, title: 'Big Mac - Light', value: 17.9),
          CartItem(
            qty: 1,
            title: 'X-Frango',
            value: 12.9,
            addons: [
              ItemAddon(qty: 1, title: 'Bacon', value: 4),
              ItemAddon(qty: 1, title: 'Picles', value: 3),
              ItemAddon(qty: 1, title: 'Cebola Caramelizada', value: 2.5),
            ],
          )
        ],
        orderShortDescription: '1x Dogão, 1x Coca-Cola 350ml',
        deliveryFee: 5.00,
        itemsValue: 20,
        finalPrice: 25.00,
        user: null,
        discountAmount: 0,
      ),
      Order(
          id: '528b28c9-80c5-4693-961d-8e611089d84e',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          friendlyId: '#1A7J8O4D23',
          userDataOnOrder: {
            "firstName": "Rafael",
            "lastName": "Fagundes",
            "address": {
              "complement": "",
              "city": "São João del Rei",
              "houseNumber": "150",
              "latitude": "-21.139510",
              "longitude": "-44.262767",
              "neighbourhood": "Guarda-Mor",
              "state": "MG",
              "street": "Rua Frederico Ozanan",
            }
          },
          status: OrderStatusType.OPEN,
          paymentType: PaymentType.CARD,
          deliveryType: DeliveryType.DELIVERY,
          items: [
            CartItem(qty: 1, title: 'Big Mac - Light', value: 17.9),
            CartItem(
              qty: 1,
              title: 'X-Frango',
              value: 12.9,
              addons: [
                ItemAddon(qty: 1, title: 'Bacon', value: 4),
                ItemAddon(qty: 1, title: 'Picles', value: 3),
                ItemAddon(qty: 1, title: 'Cebola Caramelizada', value: 2.5),
              ],
            )
          ],
          orderShortDescription: '1x Dogão, 1x Coca-Cola 350ml',
          deliveryFee: 5.00,
          itemsValue: 20,
          finalPrice: 25.00,
          user: null,
          discountAmount: 0),
    ];

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          SlideSwitchWidget(
            size: 32,
            value: option,
            options: [
              SlideSwitchOption(label: 'Novos', value: 'novos'),
              SlideSwitchOption(label: 'Em Andamento', value: 'confirmados')
            ],
            onChanged: null,
          ),
          CustomSizedBox(heightSize: 2),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Column(
                  children: <Widget>[
                    OrderItem(
                      key: ValueKey(orders[index].id),
                      order: orders[index],
                    ),
                    CustomSizedBox(heightSize: 2),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final Order order;

  const OrderItem({
    Key key,
    @required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/order-details',
          arguments: OrderDetailsArguments(order: order),
        );
      },
      child: CustomCard(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StatusLabel(status: order.status),
                  CustomText(
                    order.friendlyId,
                    size: 10,
                    color: Theme.of(context).primaryColor.withOpacity(.75),
                  )
                ],
              ),
              CustomSizedBox(heightSize: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomText(
                        '${order.userDataOnOrder['firstName']} ${order.userDataOnOrder['lastName']}',
                      ),
                      CustomSizedBox(heightSize: 0.5),
                      CustomText(
                        order.orderShortDescription,
                        color: Theme.of(context).primaryColor.withOpacity(.75),
                        size: 12,
                      ),
                    ],
                  ),
                  CustomText(
                      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                          .format(order.finalPrice))
                ],
              ),
              CustomSizedBox(heightSize: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  OrderFooter(
                    title: 'Horário do Pedido',
                    value: DateFormat('HH:mm').format(order.createdAt),
                    icon: Icons.schedule,
                  ),
                  OrderFooter(
                    title: 'Forma de Entrega',
                    value: order.deliveryType == DeliveryType.DELIVERY
                        ? 'Entrega'
                        : 'Retirada',
                    icon: order.deliveryType == DeliveryType.DELIVERY
                        ? Icons.directions_bike
                        : Icons.face,
                  ),
                  OrderFooter(
                    title: 'Pagamento',
                    value: order.paymentType == PaymentType.CARD
                        ? 'Cartão C/Déb'
                        : 'Dinheiro',
                    icon: order.paymentType == PaymentType.CARD
                        ? Icons.credit_card
                        : Icons.payment,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrderFooter extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const OrderFooter({
    Key key,
    @required this.title,
    @required this.value,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomText(
              title,
              size: 10,
              color: Theme.of(context).primaryColor.withOpacity(.75),
            ),
            CustomSizedBox(heightSize: 0.5),
            Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 14,
                ),
                CustomSizedBox(widthSize: 0.5),
                CustomText(
                  value,
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
