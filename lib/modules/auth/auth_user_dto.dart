import 'package:flutter/foundation.dart';

class AuthUserDto {
  final String firstName;
  final String lastName;
  final String email;
  final String accessToken;
  final String imageUrl;
  final bool isCancelled;
  final String password;

  AuthUserDto({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    this.accessToken,
    this.password,
    this.imageUrl,
    this.isCancelled = false,
  });
}
