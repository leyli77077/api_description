import 'dart:convert';

import 'package:flutter_shop/constants/app_constants.dart';
import 'package:flutter_shop/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigPreference {
  final SharedPreferences _pref;

  static late ConfigPreference instance;

  factory ConfigPreference(SharedPreferences pref) {
    instance = ConfigPreference._internal(pref);
    return instance;
  }

  ConfigPreference._internal(this._pref);

  static User? getUser() {
    dynamic data = instance._pref.getString(AppConstants.user);
    User? user = data != null ? User.fromMap(jsonDecode(data)) : null;
    return user;
  }

  static Future<bool> setUser(User user) {
    return instance._pref.setString(AppConstants.user, user.toJson());
  }

  static Future removeUser() {
    return instance._pref.remove(AppConstants.user);
  }

  static String? getToken() {
    return instance._pref.getString(AppConstants.accessToken);
  }

  static Future<bool> setToken(String data) {
    return instance._pref.setString(AppConstants.accessToken, data);
  }

  static Future<bool> removeToken() {
    return instance._pref.remove(AppConstants.accessToken);
  }

  static String loadLangCode() {
    return instance._pref.getString(AppConstants.languageCode) ??
        AppConstants.defaultLanguageCode;
  }
}
