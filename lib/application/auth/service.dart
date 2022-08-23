import 'package:flutter/foundation.dart';
import 'package:flutter_shop/application/cart/service.dart' as cart;
import 'package:flutter_shop/core/config_preference.dart';
import 'package:flutter_shop/core/exceptions.dart';
import 'package:flutter_shop/domain/form/login_form.dart';
import 'package:flutter_shop/domain/form/otp_form.dart';
import 'package:flutter_shop/domain/form/register_form.dart';
import 'package:flutter_shop/domain/response/login_response.dart';
import 'package:flutter_shop/domain/user.dart';
import 'package:flutter_shop/infrastructure/data/api_data.dart';
import 'package:flutter_shop/infrastructure/repository/auth_repository.dart';

part 'event.dart';
part 'state.dart';

class AuthService extends ChangeNotifier {
  // Singleton layer
  static AuthService instance = AuthService._internal();

  AuthService._internal() {
    // _state = EmptyState();
    // add(InitEvent());
  }

  factory AuthService() => instance;
  // Singleton layer end
  AuthState _state = EmptyState();

  AuthState get state => _state;
  set state(AuthState state) => state;

  emit(AuthState newState) {
    _state = newState;
    notifyListeners();
  }

  void verify(VerifiedState state) {
    emit(state);
    cart.CartService.instnance.add(cart.InitEvent());
  }

  void add(AuthEvent event) async {
    emit(LoadingState());
    if (event is InitEvent) {
      User? user = ConfigPreference.getUser();
      String? token = ConfigPreference.getToken();
      if (user != null && token != null) {
        ApiData.accessToken = token;
        verify(VerifiedState(accessToken: token, user: user));
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
        ApiData.accessToken = response.accessToken;
        verify(VerifiedState(
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
        ApiData.accessToken = null;
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
        verify(VerifiedState(accessToken: token, user: user));
      }
      return result;
    } catch (e) {
      return false;
    }
  }
}
