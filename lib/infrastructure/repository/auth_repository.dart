import 'dart:convert';

import '../../application/auth/service.dart';
import '../../core/constants/app_constants.dart';
import '../../core/exceptions.dart';
import '../../domain/form/register_form.dart';
import '../../domain/response/login_response.dart';
import '../../domain/user.dart';
import '../data/api_data.dart';

class AuthRepository {
  static Future<bool> register({required RegisterForm form}) async {
    var response = await ApiData.post(
      Uri.parse('${AppConstants.currentHost}/api/customers/auth/register'),
      body: form.toJson(),
    );
    var decoded = jsonDecode(response.body);
    if (decoded['success'] == true) {
      return true;
    }
    Map<String, dynamic> map = decoded['errors'];
    var messages = map.map((key, value) => MapEntry(
        key,
        value is List<dynamic>
            ? value.map((e) => e.toString()).toList()
            : [value.toString()]));
    throw VerificationException(messages);
  }

  static Future<bool> otp({required int phone}) async {
    var response = await ApiData.post(
      Uri.parse('${AppConstants.currentHost}/api/customers/auth/otp'),
      body: jsonEncode({
        'phone': phone,
      }),
    );
    var decoded = jsonDecode(response.body);
    if (response.statusCode == 200 && decoded['success'] == true) {
      return true;
    } else {
      throw SingleErrorException(
        error: decoded['message'],
        header: response.headers,
      );
    }
  }

  static Future<LoginResponse> login(
    int phone,
    int otp,
    bool rememberMe,
  ) async {
    var response = await ApiData.post(
      Uri.parse('${AppConstants.currentHost}/api/customers/auth/login'),
      body: jsonEncode({
        'phone': phone,
        'otp': otp.toString(),
        'remember_me': rememberMe,
      }),
    );
    var decoded = jsonDecode(response.body);
    if (decoded['success'] == true) {
      return LoginResponse.fromMap(decoded['data']);
    } else {
      throw SingleErrorException(error: decoded['message']);
    }
  }

  static Future<bool> logout() async {
    var response = await ApiData.post(
      Uri.parse('${AppConstants.currentHost}/api/customers/auth/logout'),
    );
    var decoded = jsonDecode(response.body);
    if (response.statusCode == 200 && decoded['success'] == true) {
      return true;
    } else {
      return true;
    }
  }

  static Future<bool> userUpdate({
    required User user,
  }) async {
    var response = await ApiData.post(
      Uri.parse('${AppConstants.currentHost}/api/customers/settings/info'),
      body: user.toJson(),
    );
    var decoded = jsonDecode(response.body);
    if (response.statusCode == 200 && decoded['success'] == true) {
      return true;
    } else if (decoded['message'] == 'Unauthenticated.') {
      AuthService.instance.add(LogoutEvent());
      return false;
    } else {
      return false;
    }
  }
}
