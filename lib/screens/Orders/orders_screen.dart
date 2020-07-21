import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kwik_biz_flutter/modules/orders/order_model.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
import 'package:kwik_biz_flutter/widgets/custom_card.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/custom_text.dart';
import 'package:kwik_biz_flutter/widgets/slide_switch_widget.dart';

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
        items: null,
        orderShortDescription: '1x Dogão, 1x Coca-Cola 350ml',
        deliveryFee: 5.00,
        itemsValue: 20,
        finalPrice: 25.00,
        user: null,
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
        items: null,
        orderShortDescription: '1x Dogão, 1x Coca-Cola 350ml',
        deliveryFee: 5.00,
        itemsValue: 20,
        finalPrice: 25.00,
        user: null,
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
        items: null,
        orderShortDescription: '1x Dogão, 1x Coca-Cola 350ml',
        deliveryFee: 5.00,
        itemsValue: 20,
        finalPrice: 25.00,
        user: null,
      ),
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
    return CustomCard(
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
                CustomText(NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
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

class StatusLabel extends StatelessWidget {
  final OrderStatusType status;

  const StatusLabel({
    Key key,
    @required this.status,
  }) : super(key: key);

  Map<String, dynamic> _getStatusTextAndColor() {
    switch (this.status) {
      case OrderStatusType.CONFIRMED:
        return {
          "text": "Confirmado",
          "color": Colors.green,
        };
      case OrderStatusType.CANCELED_BY_STORE:
        return {
          "text": "Cancelado",
          "color": Colors.red,
        };
      case OrderStatusType.CANCELED_BY_USER:
        return {
          "text": "Cancelado P/ Cliente",
          "color": Colors.red,
        };
      case OrderStatusType.DELIVERED:
        return {
          "text": "Entregue",
          "color": Colors.purple[600],
        };
      case OrderStatusType.EXPIRED:
        return {
          "text": "Expirado",
          "color": Colors.orange,
        };
      case OrderStatusType.ON_DELIVERY:
        return {
          "text": "Entregando",
          "color": Colors.deepOrange,
        };
      case OrderStatusType.READY_FOR_PICKUP:
        return {
          "text": "Esperando Retirada",
          "color": Colors.deepPurple,
        };

      default:
        return {
          "text": "Novo",
          "color": Colors.lightBlue,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> statusTextAndColor = _getStatusTextAndColor();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 16,
      decoration: BoxDecoration(
        color: statusTextAndColor['color'],
        // boxShadow: [
        //   BoxShadow(
        //       blurRadius: 4,
        //       offset: Offset(0, 4),
        //       color: Colors.black.withOpacity(0.05))
        // ],
        borderRadius: BorderRadius.all(
          Radius.circular(2),
        ),
      ),
      child: Center(
        child: CustomText(
          statusTextAndColor['text'],
          color: Colors.white,
          size: 10,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}
