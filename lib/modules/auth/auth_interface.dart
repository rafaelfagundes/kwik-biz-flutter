import './auth_response_dto.dart';

abstract class IAuth {
  Future<AuthResponseDto> signInWithEmailAndPassword(
      String email, String password);
  Future<bool> passwordRecovery(String email);
  Future<bool> signOut();
}
