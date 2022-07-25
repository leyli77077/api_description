import 'package:flutter/material.dart';
import 'package:flutter_shop/core/config_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {
  static Settings instance = Settings._internal();
  late String _language;

  factory Settings({SharedPreferences? prefs}) {
    return instance;
  }

  Settings._internal() {
    _language = ConfigPreference.loadLangCode();
  }

  void setLanguage(String lang) {
    // başda _language-e täze gelen lang-y dakýarys we göni
    // notifyListeners(); edýäris we täze dili SharedPreferences
    // saklaýarys.
    _language = lang;
    notifyListeners();
    ConfigPreference.setLangCode(lang);
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
