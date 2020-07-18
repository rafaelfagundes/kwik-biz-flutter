import 'package:flutter/foundation.dart';
import 'package:kwik_biz_flutter/modules/user/user_model.dart';

enum UserResponseStatus { CREATED, ALREADY_EXISTS, ERROR }

class UserResponseDto {
  final User user;
  final UserResponseStatus status;
  final String message;

  UserResponseDto({
    @required this.user,
    @required this.status,
    @required this.message,
  });
}
