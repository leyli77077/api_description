import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFF67952);
const Color bgColor = Color(0xFFFBFBFD);

const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;

class ColorConstants {
  static Color gray50 = hexToColor('#e9e9e9');
  static Color gray100 = hexToColor('#bdbebe');
  static Color gray200 = hexToColor('#929293');
  static Color gray300 = hexToColor('#666667');
  static Color gray400 = hexToColor('#505151');
  static Color gray500 = hexToColor('#242526');
  static Color gray600 = hexToColor('#202122');
  static Color gray700 = hexToColor('#191a1b');
  static Color gray800 = hexToColor('#121313');
  static Color gray900 = hexToColor('#0e0f0f');
}

class LightColor {
  static const Color background = Color(0XFFFFFFFF);

  static const Color titleTextColor = Color(0xff1d2635);
  static const Color subTitleTextColor = Color(0xff797878);

  static const Color skyBlue = Color(0xff2890c8);
  static const Color lightBlue = Color(0xff5c3dff);

  static const Color orange = Color(0xffE65829);
  static const Color red = Color(0xffF72804);

  static const Color lightGrey = Color(0xffE1E2E4);
  static const Color grey = Color(0xffA1A3A6);
  static const Color darkgrey = Color(0xff747F8F);

  static const Color iconColor = Color(0xffa8a09b);
  static const Color yellowColor = Color(0xfffbba01);

  static const Color black = Color(0xff20262C);
  static const Color lightblack = Color(0xff5F5F60);
}

class AppFont {
  static const regular = TextStyle(
    fontFamily: 'Open Sans',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 18,
  );

  static const medium = TextStyle(
    fontFamily: 'Open Sans',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 18,
  );

  static const bold = TextStyle(
    fontFamily: 'Open Sans',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 18,
  );
  static const semiBold = TextStyle(
    fontFamily: 'Open Sans',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 18,
  );

}

class AppColors {
  static const Color primaryColorRed = Color(0xffDB3022);
  static const Color primaryColorGray = Color(0xff9B9B9B);
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}

