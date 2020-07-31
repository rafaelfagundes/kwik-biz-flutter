import './notification_response_dto.dart';

abstract class INotification {
  Future<NotificationResponseDto> getNotification(String id);
  // Future<NotificationResponseDto> createNotification(
  //     NotificationRequestDto notification);
  Future<List<NotificationResponseDto>> getAllNotifications(String id);
  //Future<NotificationResponseDto> deleteNotification(String id);
}
