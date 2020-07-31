import 'package:flutter/foundation.dart';
import 'package:kwik_biz_flutter/shared/enums.dart';
//import './notification_model.dart';

class NotificationResponseDto {
  final String id;
  final String title;
  final String subTitle;
  final NotificationType notificationType;
  final bool isRead;
  final Map<String, String> additionalInfo;
  final DateTime createdAt;

  NotificationResponseDto({
    @required this.id,
    @required this.title,
    @required this.subTitle,
    @required this.notificationType,
    @required this.isRead,
    @required this.additionalInfo,
    @required this.createdAt,
  });
}
