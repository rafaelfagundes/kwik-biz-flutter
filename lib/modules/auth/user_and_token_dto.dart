import 'package:flutter/foundation.dart';
import 'package:kwik_biz_flutter/modules/user/user_model.dart';

class UserAndTokenDto {
  final User user;
  final String token;
  final int status;

  UserAndTokenDto(
      {@required this.user, @required this.token, @required this.status});
}
