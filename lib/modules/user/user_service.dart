import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kwik_biz_flutter/config/api_config.dart';
import 'package:kwik_biz_flutter/modules/auth/auth_user_dto.dart';
import 'package:kwik_biz_flutter/modules/user/user_interface.dart';
import 'package:kwik_biz_flutter/modules/user/user_model.dart';
import 'package:kwik_biz_flutter/modules/user/user_response_dto.dart';

class UserService implements IUser {
  @override
  Future<UserResponseDto> createUser(AuthUserDto user) async {
    String url = '${Api.baseUrl}/users';

    var response = await http.post(url, body: {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'gender': 'O',
    });

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    switch (response.statusCode) {
      case 201:
        try {
          User user = User.fromJson(json.decode(response.body));
          UserResponseDto userResponse = UserResponseDto(
              user: user,
              status: UserResponseStatus.CREATED,
              message: 'Usuário criado com sucesso');
          return userResponse;
        } catch (e) {
          UserResponseDto userResponse = UserResponseDto(
              user: null,
              status: UserResponseStatus.ERROR,
              message: 'Erro ao tentar criar usuário');
          return userResponse;
        }
        break;
      default:
        UserResponseDto userResponse = UserResponseDto(
            user: null,
            status: UserResponseStatus.ERROR,
            message: 'Erro ao tentar criar usuário');
        return userResponse;
    }
  }

  Future<UserResponseDto> createUserWithEmailAndPassword(
      AuthUserDto user) async {
    String url = '${Api.baseUrl}/users/user-and-password';

    var response = await http.post(url, body: {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'email': user.email,
      'gender': 'O',
      'password': user.password
    });

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    switch (response.statusCode) {
      case 201:
        try {
          User user = User.fromJson(json.decode(response.body));
          UserResponseDto userResponse = UserResponseDto(
              user: user,
              status: UserResponseStatus.CREATED,
              message: 'Usuário criado com sucesso');
          return userResponse;
        } catch (e) {
          UserResponseDto userResponse = UserResponseDto(
              user: null,
              status: UserResponseStatus.ERROR,
              message: 'Erro ao tentar criar usuário');
          return userResponse;
        }
        break;
      case 409:
        UserResponseDto userResponse = UserResponseDto(
            user: null,
            status: UserResponseStatus.ALREADY_EXISTS,
            message: 'O usuário já está cadastrado');
        return userResponse;
      default:
        UserResponseDto userResponse = UserResponseDto(
            user: null,
            status: UserResponseStatus.ERROR,
            message: 'Erro ao tentar criar usuário');
        return userResponse;
    }
  }

  @override
  Future getUser(String id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
