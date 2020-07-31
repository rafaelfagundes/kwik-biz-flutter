import 'package:flutter/foundation.dart';

import './notification_response_dto.dart';
import './notification_service.dart';

class NotificationController {
  NotificationService notificationService;
  NotificationController({@required this.notificationService});

  Future<NotificationResponseDto> getNotification(String id) async {
    return await this.notificationService.getNotification(id);
  }

  Future<List<NotificationResponseDto>> getAllNotifications(String id) async {
    return await this.notificationService.getAllNotifications(id);
  }

  // Future<NotificationResponseDto> createNotification(NotificationRequestDto notification) async {
  // 	return await this.notificationService.createNotification(notification);
  // }
}
