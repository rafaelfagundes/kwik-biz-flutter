import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:intl/intl.dart';
import 'package:kwik_biz_flutter/modules/notification/notification_controller.dart';
import 'package:kwik_biz_flutter/modules/notification/notification_response_dto.dart';
import 'package:kwik_biz_flutter/modules/notification/notification_service.dart';
import 'package:kwik_biz_flutter/utils/currency_utils.dart';
import 'package:kwik_biz_flutter/widgets/custom_card.dart';
import 'package:kwik_biz_flutter/widgets/custom_sized_box.dart';
import 'package:kwik_biz_flutter/widgets/read_label.dart';

import '../../widgets/DefaultScreen/default_screen.dart';
import '../../widgets/custom_text.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationResponseDto> notificationList;
  NotificationController controller =
      NotificationController(notificationService: NotificationService());

  void _getNotifications() async {
    List<NotificationResponseDto> _notificationList = await controller
        .getAllNotifications("06c2cfe6-0a27-45e8-9ecb-586ad1e816a3");

    inspect(_notificationList);

    setState(() {
      notificationList = _notificationList;
    });
  }

  @override
  void initState() {
    _getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      'Notificações',
      children: [
        Container(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              73,
          child: ListView.builder(
            itemCount: notificationList.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return Column(
                children: <Widget>[
                  NotificationItem(
                    key: ValueKey(notificationList[index].id),
                    notification: notificationList[index],
                  ),
                  CustomSizedBox(heightSize: 2),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationResponseDto notification;

  const NotificationItem({
    Key key,
    @required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/order-details',
          // arguments: OrderDetailsArguments(order: order),
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
                  ReadLabel(isRead: notification.isRead),
                  CustomText(
                    DateFormat('EEE, dd/MM - HH:mm')
                        .format(notification.createdAt),
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
                      CustomText(notification.title),
                      CustomSizedBox(heightSize: 0.5),
                      CustomText(
                        notification.subTitle,
                        color: Theme.of(context).primaryColor.withOpacity(.75),
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
              CustomSizedBox(heightSize: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  NotificationFooter(
                    title: 'ID do Pedido',
                    value: '#8S4T6VTY5',
                    icon: SFSymbols.doc_text,
                  ),
                  NotificationFooter(
                    title: 'Valor do Pedido',
                    value: CurrencyUtils.toBRL(double.parse(
                        notification.additionalInfo['totalValue'])),
                    icon: SFSymbols.money_dollar_circle,
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

class NotificationFooter extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const NotificationFooter({
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
