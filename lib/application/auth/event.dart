part of 'service.dart';

abstract class AuthEvent {}

class InitEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginForm form;
  LoginEvent({
    required this.form,
  });
}

class WithOtpEvent extends AuthEvent {
  final int phone;
  final int otp;
  final bool rememberMe;
  WithOtpEvent({
    required this.phone,
    required this.otp,
    required this.rememberMe,
  });
}

class RegisterEvent extends AuthEvent {
  final RegisterForm form;
  // final String? email;
  RegisterEvent({required this.form});
}

class OpenRegisterEvent extends AuthEvent {}

class OpenLoginEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {
  LogoutEvent();
}
