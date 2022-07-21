import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConstants {
  // Default gelýän dil hökmünde
  static const defaultLanguageCode = 'tk';
  // SharedPreference üçin key bolýar
  static const languageCode = 'languageCode';
}

class Settings extends ChangeNotifier {
  static Settings? instance;
  late String _language;

  factory Settings({SharedPreferences? prefs}) {
    if (instance != null) {
      return instance!;
    } else {
      instance = Settings._internal(prefs!);
      return instance!;
    }
  }

  Settings._internal(SharedPreferences prefs) {
    _language = prefs.getString(AppConstants.languageCode) ??
        AppConstants.defaultLanguageCode;
  }

  void setLanguage(String lang) async {
    // başda _language-e täze gelen lang-y dakýarys we göni
    // notifyListeners(); edýäris we täze dili SharedPreferences
    // saklaýarys.
    _language = lang;
    notifyListeners();
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(AppConstants.languageCode, lang);
  }

  // bunyda main-da consumerda ýa-da selectorda languagy almak üçin ulanýarys
  Locale get language {
    switch (_language) {
      case 'ru':
        return const Locale('ru');
      case 'en':
        return const Locale('en', 'US');
      case 'tk':
        return const Locale('tk');
      default:
        return const Locale('en', 'US');
    }
  }
}