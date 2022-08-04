import 'package:flutter/foundation.dart';
import 'package:flutter_shop/core/config_preference.dart';
import 'package:flutter_shop/core/exceptions.dart';
import 'package:flutter_shop/domain/form/login_form.dart';
import 'package:flutter_shop/domain/form/otp_form.dart';
import 'package:flutter_shop/domain/form/register_form.dart';
import 'package:flutter_shop/domain/response/login_response.dart';
import 'package:flutter_shop/domain/user.dart';
import 'package:flutter_shop/repository/auth_repository.dart';

// === === === === === EVENTS === === === === ===

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

// === === === === === STATES === === === === ===

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

// === === === === === NOTIFIER === === === === ===

class Auth extends ChangeNotifier {
  // Singleton layer
  static Auth instance = Auth._internal();

  Auth._internal() {
    // _state = EmptyState();
    // add(InitEvent());
  }

  factory Auth() => instance;
  // Singleton layer end
  AuthState _state = EmptyState();

  AuthState get state => _state;
  set state(AuthState state) => state;

  emit(AuthState newState) {
    _state = newState;
    notifyListeners();
  }

  void add(AuthEvent event) async {
    emit(LoadingState());
    if (event is InitEvent) {
      User? user = ConfigPreference.getUser();
      String? token = ConfigPreference.getToken();
      if (user != null && token != null) {
        AuthRepository.accessToken = token;
        emit(VerifiedState(accessToken: token, user: user));
      } else {
        emit(NotVerifiedState());
      }
    } else if (event is RegisterEvent) {
      try {
        bool result = await AuthRepository.register(form: event.form);
        if (result) {
          emit(OtpFormState(
            form: OtpForm(phone: event.form.phone),
          ));
        } else {
          emit(RegisterFormState());
        }
      } on VerificationException catch (e) {
        emit(RegisterFormState(form: event.form, errors: e.messages));
      } catch (e) {
        emit(RegisterFormState(
          form: event.form,
          errors: {
            'error': ['connection_error'],
          },
        ));
      }
    } else if (event is WithOtpEvent) {
      try {
        LoginResponse response = await AuthRepository.login(
          event.phone,
          event.otp,
          event.rememberMe,
        );
        await ConfigPreference.setToken(response.accessToken);
        await ConfigPreference.setUser(response.user);
        AuthRepository.accessToken = response.accessToken;
        emit(VerifiedState(
          accessToken: response.accessToken,
          user: response.user,
        ));
      } on SingleErrorException catch (e) {
        emit(OtpFormState(
          form: OtpForm(
            phone: event.phone,
            otp: event.otp,
            rememberMe: event.rememberMe,
          ),
          error: e.error,
        ));
      } catch (e) {
        emit(OtpFormState(
          form: OtpForm(
            phone: event.phone,
            otp: event.otp,
            rememberMe: event.rememberMe,
          ),
          error: 'connection_error',
        ));
      }
    } else if (event is LoginEvent) {
      try {
        bool otpResult = await AuthRepository.otp(phone: event.form.phone);
        if (otpResult) {
          emit(OtpFormState(
            form: OtpForm(phone: event.form.phone),
          ));
        } else {
          emit(LoginFormState(
            form: event.form,
            error: 'connection_error',
          ));
        }
      } on SingleErrorException catch (e) {
        emit(LoginFormState(
          form: event.form,
          error: e.error,
          time: e.header?['retry-after'],
        ));
      } catch (e) {
        emit(LoginFormState(
          form: event.form,
          error: 'connection_error',
        ));
      }
    } else if (event is LogoutEvent) {
      try {
        AuthRepository.logout();
        await ConfigPreference.removeUser();
        await ConfigPreference.removeToken();
        AuthRepository.accessToken = null;
        emit(LogoutState());
      } catch (e) {
        emit(state);
      }
    } else if (event is OpenRegisterEvent) {
      emit(RegisterFormState());
    } else if (event is OpenLoginEvent) {
      emit(LoginFormState());
    }
  }

  Future<bool> updateUser(String token, User user) async {
    try {
      bool result = await AuthRepository.userUpdate(user: user);
      if (result) {
        emit(VerifiedState(accessToken: token, user: user));
      }
      return result;
    } catch (e) {
      return false;
    }
  }
}
