import 'package:flutter/material.dart';

class AppConstants {
  static const localHost = 'http://10.10.11.99:8000';
  static const remoteHost = 'http://shop.asmantiz.com';
  static const currentHost = remoteHost;
  // Default gelýän dil hökmünde
  static const Locale defaultLocale = Locale('tk');
  static const defaultLanguageCode = 'tk';
  // SharedPreference üçin key bolýar
  static const languageCode = 'languageCode';
  static const String user = 'user';
  static const String accessToken = 'accessToken';
  static const String productsOpen = 'PRODUCTS_OPEN';
  static const String categoryOpen = 'CATEGORY_OPEN';
  static const String brandOpen = 'BRAND_OPEN';
}
