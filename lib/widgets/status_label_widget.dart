import 'package:flutter/material.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
import 'package:kwik_biz_flutter/widgets/custom_text.dart';

class StatusLabel extends StatelessWidget {
  final OrderStatusType status;
  final double size;

  const StatusLabel({
    Key key,
    @required this.status,
    this.size = 10,
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
      padding: EdgeInsets.symmetric(horizontal: size * 0.8),
      height: size * 1.6,
      decoration: BoxDecoration(
        color: statusTextAndColor['color'],
        borderRadius: BorderRadius.all(
          Radius.circular(size * 0.4),
        ),
      ),
      child: Center(
        child: CustomText(
          statusTextAndColor['text'],
          color: Colors.white,
          size: size,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}
