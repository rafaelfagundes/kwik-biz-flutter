import 'package:flutter/foundation.dart';

import './auth_response_dto.dart';
import './auth_service.dart';
import '../user/user_controller.dart';

class AuthController {
  final AuthService authService;
  final UserController userController;
  AuthController({@required this.authService, @required this.userController});

  Future<AuthResponseDto> signInWithEmailAndPassword(
      String email, String password) async {
    return await this.authService.signInWithEmailAndPassword(email, password);
  }

  Future<bool> passwordRecovery(String email) async {
    return await this.authService.passwordRecovery(email);
  }
}
