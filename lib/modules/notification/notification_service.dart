import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kwik_biz_flutter/shared/enums.dart';

import './notification_interface.dart';
import './notification_model.dart';
import './notification_response_dto.dart';
import '../../config/api_config.dart';

class NotificationService implements INotification {
  @override
  Future<NotificationResponseDto> getNotification(String id) async {
    String url = '${Api.baseUrl}/notification/$id';

    var response = await http.get(url);

    switch (response.statusCode) {
      case 201:
        try {
          Notification notification =
              Notification.fromJson(json.decode(response.body));
          NotificationResponseDto notificationResponse =
              NotificationResponseDto(
            id: 'a306c703-5510-4af0-a062-ed99f1d1b498',
            createdAt: DateTime.now(),
            title: 'Novo Pedido',
            subTitle: '1x Big Mac, 2x Coca-Cola, 1x Batata Frita',
            notificationType: NotificationType.NEW_ORDER,
            isRead: false,
            additionalInfo: {
              "orderFriendlyId": "b6017a07-5e5f-41fd-9ff7-3c1c4080c48b",
              "totalValue": "45"
            },
          );
          return notificationResponse;
        } catch (e) {
          return null;
        }
        break;
      default:
        try {
          Notification notification =
              Notification.fromJson(json.decode(response.body));
          NotificationResponseDto notificationResponse =
              NotificationResponseDto(
            id: 'a306c703-5510-4af0-a062-ed99f1d1b498',
            createdAt: DateTime.now(),
            title: 'Novo Pedido',
            subTitle: '1x Big Mac, 2x Coca-Cola, 1x Batata Frita',
            notificationType: NotificationType.NEW_ORDER,
            isRead: false,
            additionalInfo: {
              "orderFriendlyId": "b6017a07-5e5f-41fd-9ff7-3c1c4080c48b",
              "totalValue": "45"
            },
          );
          return notificationResponse;
        } catch (e) {
          return null;
        }
        break;
    }
  }

  // @override
  // Future<NotificationResponseDto> createNotification(
  //     NotificationRequestDto notification) async {
  //   String url = '${Api.baseUrl}/notification';

  //   var response = await http.post(url, body: notification);

  //   switch (response.statusCode) {
  //     case 201:
  //       try {
  //         Notification notification =
  //             Notification.fromJson(json.decode(response.body));
  //         NotificationResponseDto notificationResponse =
  //             NotificationResponseDto(
  //           id: notification.id,
  //         );
  //         return notificationResponse;
  //       } catch (e) {
  //         return null;
  //       }
  //       break;
  //     default:
  //       try {
  //         Notification notification =
  //             Notification.fromJson(json.decode(response.body));
  //         NotificationResponseDto notificationResponse =
  //             NotificationResponseDto(
  //           id: notification.id,
  //         );
  //         return notificationResponse;
  //       } catch (e) {
  //         return null;
  //       }
  //       break;
  //   }
  // }

  @override
  Future<List<NotificationResponseDto>> getAllNotifications(String id) async {
    List<NotificationResponseDto> notificationList = [
      NotificationResponseDto(
        id: 'a306c703-5510-4af0-a062-ed99f1d1b498',
        createdAt: DateTime.now(),
        title: 'Novo Pedido',
        subTitle: '1x Big Mac, 2x Coca-Cola, 1x Batata Frita',
        notificationType: NotificationType.NEW_ORDER,
        isRead: false,
        additionalInfo: {
          "orderFriendlyId": "b6017a07-5e5f-41fd-9ff7-3c1c4080c48b",
          "totalValue": "45"
        },
      ),
      NotificationResponseDto(
        id: 'e761b660-245a-4c25-b277-e250f0e52415',
        createdAt: DateTime.now(),
        title: 'Novo Pedido',
        subTitle: '1x Hot Dog, 2x Coca-Cola, 1x Batata Frita',
        notificationType: NotificationType.NEW_ORDER,
        isRead: true,
        additionalInfo: {
          "orderFriendlyId": "123fa8ae-dd09-41b5-9cbd-8acf9fb66d75",
          "totalValue": "18.9"
        },
      ),
    ];

    return notificationList;
  }
}
