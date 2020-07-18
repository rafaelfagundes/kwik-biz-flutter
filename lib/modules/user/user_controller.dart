import 'package:flutter/foundation.dart';
import 'package:kwik_biz_flutter/modules/auth/auth_user_dto.dart';
import 'package:kwik_biz_flutter/modules/user/user_response_dto.dart';
import 'package:kwik_biz_flutter/modules/user/user_service.dart';

class UserController {
  UserService userService;
  UserController({@required this.userService});

  Future<UserResponseDto> createUser(AuthUserDto user) async {
    return await this.userService.createUser(user);
  }

  Future<UserResponseDto> createUserWithEmailAndPassword(
      AuthUserDto user) async {
    return await this.userService.createUserWithEmailAndPassword(user);
  }
}
