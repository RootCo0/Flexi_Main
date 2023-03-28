 import 'package:flutter/material.dart';

import 'font_manager.dart';

TextStyle _style(
    double fontSize, String fontFamily, Color color, FontWeight fontWeight) {
  return TextStyle(
      fontSize: fontSize,
      color: color,
      fontFamily: fontFamily,
      fontWeight: fontWeight);
}

// regular style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
   Color color=Colors.black,
}) {
  return _style(
      fontSize, FontConstants.fontFamily, color, FontWeightManager.regular);
}

// light style
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
   Color color=Colors.black,
}) {
  return _style(
      fontSize, FontConstants.fontFamily, color, FontWeightManager.light);
}

// medium style
TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
   Color color=Colors.black,
}) {
  return _style(
      fontSize, FontConstants.fontFamily, color, FontWeightManager.medium);
}

// semi bold style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
   Color color=Colors.black,
}) {
  return _style(
      fontSize, FontConstants.fontFamily, color, FontWeightManager.semiBold);
}

// bold style
TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
   Color color=Colors.black,
}) {
  return _style(
      fontSize, FontConstants.fontFamily, color, FontWeightManager.bold);
}
// title style
TextStyle getMainTitleStyle({
  double fontSize = FontSize.s35,
   Color color=Colors.black,
}) {
  return _style(
      fontSize, FontConstants.fontFamily, color, FontWeightManager.medium);
}
// sub title style
TextStyle getSubTitleStyle({
  double fontSize = FontSize.s16,
   Color color=Colors.black,
}) {
  return _style(
      fontSize, FontConstants.fontFamily, color, FontWeightManager.light);
}
// label style
TextStyle getLableStyle({
  double fontSize = FontSize.s21,
   Color color=Colors.black,
}) {
  return _style(
      fontSize, FontConstants.fontFamily, color, FontWeightManager.medium);
}
// button style
TextStyle getButtonStyle({
  double fontSize = FontSize.s20,
   Color color=Colors.black,
}) {
  return _style(
      fontSize, FontConstants.fontFamily, color, FontWeightManager.medium);
}
