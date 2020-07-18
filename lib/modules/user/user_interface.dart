import 'package:kwik_biz_flutter/modules/auth/auth_user_dto.dart';
import 'package:kwik_biz_flutter/modules/user/user_response_dto.dart';

abstract class IUser {
  Future getUser(String id);
  Future<UserResponseDto> createUser(AuthUserDto user);
  Future<UserResponseDto> createUserWithEmailAndPassword(AuthUserDto user);
}
