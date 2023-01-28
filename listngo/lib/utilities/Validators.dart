import 'package:email_validator/email_validator.dart';

String? isPasswordValid(String password) =>
    password.length >= 6 ? null : "Invalid Password";

String? isEmailValid(String email) {
  return EmailValidator.validate(email) ? null : "Invalid Email";
}
