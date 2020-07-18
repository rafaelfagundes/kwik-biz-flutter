import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:kwik_biz_flutter/config/api_config.dart';

import './auth_interface.dart';
import './auth_response_dto.dart';
import './user_and_token_dto.dart';
import '../user/user_model.dart';
import '../user/user_service.dart';

class AuthService implements IAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final UserService userService;
  AuthService({@required this.userService});

  Future<UserAndTokenDto> _getUserAndToken(
      String email, String accessToken, String type) async {
    try {
      String url = '${Api.baseUrl}/auth/sign-in';
      // print('chamando: $url');

      var response = await http.post(url, body: {
        'email': email,
        'secret': accessToken,
        'type': type,
      });

      switch (response.statusCode) {
        case 201:
          Map<String, dynamic> responseFromJson = json.decode(response.body);
          var user = User.fromJson(responseFromJson['user']);
          String token = responseFromJson['token'].toString();
          var userAndToken = UserAndTokenDto(
              user: user, token: token, status: response.statusCode);
          return userAndToken;
        case 404:
          var userAndToken = UserAndTokenDto(
              user: null, token: null, status: response.statusCode);
          return userAndToken;
        default:
          var userAndToken =
              UserAndTokenDto(user: null, token: null, status: 500);
          return userAndToken;
      }
    } catch (e) {
      print(e.toString());
      var userAndToken = UserAndTokenDto(user: null, token: null, status: 500);
      return userAndToken;
    }
  }

  @override
  Future<AuthResponseDto> signInWithEmailAndPassword(email, password) async {
    try {
      print('Trying firebase');
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print('Firebase Result?');

      if (result.user == null) {
        print('DOESNT HAVE RESULT');
        return AuthResponseDto(
          user: null,
          status: AuthResponseStatus.ERROR,
          message: 'Erro ao conectar. Tente novamente mais tarde.',
          token: null,
        );
      }

      AuthResponseDto authResponse;
      IdTokenResult idToken = await result.user.getIdToken(refresh: true);

      UserAndTokenDto userAndToken =
          await _getUserAndToken(email, idToken.token, 'EMAIL');

      // If user exists
      if (userAndToken.status == 201) {
        authResponse = AuthResponseDto(
          user: userAndToken.user,
          status: AuthResponseStatus.OK,
          message: null,
          token: userAndToken.token,
        );
      } else if (userAndToken.status == 500) {
        authResponse = AuthResponseDto(
          user: null,
          status: AuthResponseStatus.ERROR,
          message: 'Erro ao conectar ao servidor.\nTente novamente mais tarde.',
          token: null,
        );
      } else {
        authResponse = AuthResponseDto(
          user: null,
          status: AuthResponseStatus.USER_NOT_FOUND,
          message: 'Usuário e/ou senha estão incorretos.',
          token: null,
        );
      }

      return authResponse;
    } catch (e) {
      return AuthResponseDto(
        user: null,
        status: AuthResponseStatus.ERROR,
        message: 'Erro ao conectar. Tente novamente mais tarde.',
        token: null,
      );
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> passwordRecovery(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
