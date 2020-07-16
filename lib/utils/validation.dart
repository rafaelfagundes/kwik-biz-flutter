import 'package:email_validator/email_validator.dart';

class Validation {
  static bool isValidEmail(String email) {
    return EmailValidator.validate(email);
  }
}
