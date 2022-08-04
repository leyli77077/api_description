part of 'service.dart';

abstract class AuthState {}

class LoadingState extends AuthState {}

class RegisterFormState extends AuthState {
  final RegisterForm? form;
  final Map<String, List<String>>? errors;
  RegisterFormState({this.form, this.errors});
}

class LoginFormState extends AuthState {
  final LoginForm? form;
  final String? error;
  final String? time;
  LoginFormState({
    this.form,
    this.error,
    this.time,
  });
}

class OtpFormState extends AuthState {
  final OtpForm form;
  final String? error;
  OtpFormState({
    required this.form,
    this.error,
  });
}

class VerifiedState extends AuthState {
  final User user;
  final String accessToken;
  VerifiedState({
    required this.accessToken,
    required this.user,
  });
}

class NotVerifiedState extends AuthState {
  NotVerifiedState();
}

class EmptyState extends AuthState {}

class LogoutState extends AuthState {}
