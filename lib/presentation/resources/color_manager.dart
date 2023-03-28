import 'package:flutter/material.dart';

class ColorManager {
  static Color primaryColor = HexColor.fromHex("#67B375");
  static Color lightPrimaryColor = HexColor.fromHex("#ECF9EE");
  static Color fontColor = HexColor.fromHex("#121212");
  static Color hintColor = HexColor.fromHex("#686868");
  static Color lightHintColor = HexColor.fromHex("#EDEDED");
  static Color descColor = HexColor.fromHex("#12121D").withOpacity(0.3);
  static Color paymentColor = HexColor.fromHex("#FAF9FC").withOpacity(0.44);
  static Color categoryBackgroundColor = HexColor.fromHex("#F3F3F3");
  static Color languageBackgroundColor = HexColor.fromHex("#E5E5E5");
  static Color profisionalColor = HexColor.fromHex("#FB7E00");
  static Color textFieldColor = HexColor.fromHex("#F7F8F8");
  static Color packageScreenBackgroundColor = HexColor.fromHex("#FAFAFA");
  static Color lightYellowProductColor = HexColor.fromHex("#FBFBE3");
  static Color lightBlueProductColor = HexColor.fromHex("#E3F2FB");
  static Color scaffoldBackGroundColor = HexColor.fromHex("#FFFFFF");
  static Color freeDeliveryColor = HexColor.fromHex("#272626");
  static Color darkGrey = HexColor.fromHex("#004E41");
  static Color grey = HexColor.fromHex("#7f7f7f");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#E23D24"); //red color
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString;
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
