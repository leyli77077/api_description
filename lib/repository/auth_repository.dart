import 'dart:convert';

import 'package:flutter_shop/application/auth.dart';
import 'package:flutter_shop/constants/app_constants.dart';
import 'package:flutter_shop/core/exceptions.dart';
import 'package:flutter_shop/domain/form/register_form.dart';
import 'package:flutter_shop/domain/response/login_response.dart';
import 'package:flutter_shop/domain/user.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  static Map<String, String> headers() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
  }

  static String? accessToken;

  static Future<bool> register({required RegisterForm form}) async {
    var response = await http.post(
      Uri.parse('${AppConstants.currentHost}customers/auth/register'),
      headers: headers(),
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
    var response = await http.post(
      Uri.parse('${AppConstants.currentHost}customers/auth/otp'),
      headers: headers(),
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
    var response = await http.post(
      Uri.parse('${AppConstants.currentHost}customers/auth/login'),
      headers: headers(),
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
    var response = await http.post(
      Uri.parse('${AppConstants.currentHost}customers/auth/logout'),
      headers: headers(),
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
    var response = await http.post(
      Uri.parse('${AppConstants.currentHost}customers/settings/info'),
      headers: headers(),
      body: user.toJson(),
    );
    var decoded = jsonDecode(response.body);
    if (response.statusCode == 200 && decoded['success'] == true) {
      return true;
    } else if (decoded['message'] == 'Unauthenticated.') {
      Auth.instance.add(LogoutEvent());
      return false;
    } else {
      return false;
    }
  }
}
