import 'package:flutter/foundation.dart';

import '../user/user_model.dart';

enum AuthResponseStatus { OK, CANCELLED, ERROR, USER_NOT_FOUND }

class AuthResponseDto {
  final User user;
  final AuthResponseStatus status;
  final String message;
  final String token;

  AuthResponseDto({
    @required this.user,
    @required this.status,
    @required this.message,
    @required this.token,
  });
}
