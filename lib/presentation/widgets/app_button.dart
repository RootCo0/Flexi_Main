import 'package:flutter/material.dart';

import '../resources/index.dart';
import 'index.dart';

class AppButton extends StatelessWidget {
  AppButton({
    this.translation,
    this.color,
    this.textColor = Colors.white,
    this.onTap,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
    this.fontFamily,
    this.textDecoration,
    this.border,
    this.padding,
    this.child,
    this.decoration,
    this.iconData,
    this.borderColor,
  });

  final String? translation;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String? fontFamily;
  final TextDecoration? textDecoration;
  final BoxDecoration? decoration;
  final Widget? child;
  final String? iconData;
  final EdgeInsetsGeometry? padding;
  Color? color;
  Color? borderColor;
  TextStyle? style;
  GestureTapCallback? onTap;
  BorderRadiusGeometry? border;

  @override
  Widget build(BuildContext context) {
    color ??= AppPalette.primaryColor;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        decoration: decoration ??
            BoxDecoration(
                color: color,
                borderRadius: border ?? AppCorners.lgBorder,
                border: Border.all(color: borderColor ?? color!)),
        child: child ??
            AppText(
              text: translation,
              style: style ??
                  AppTextStyles.title1.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize),
            ),
      ),
    );
  }
}
