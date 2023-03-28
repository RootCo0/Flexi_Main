import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flexi_app/presentation/widgets/app_padding.dart';
export 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBody extends StatelessWidget {
  AppBody(
      {Key? key,
      this.child,
      this.bottomSheet,
      this.leading,
      this.leadingOnTap,
      this.actionOnTap,
      this.tabBar,
      this.leadingIcon,
      this.action,
      this.actionIcon,
      this.title,
      this.column,
      this.height = true,
      this.paddingH,
      this.backgroundColor ,
      this.resizeKeyboard = true,
      this.center = true})
      : super(key: key);
  Widget? child;
  Widget? bottomSheet;
  IconData? leadingIcon;
  IconData? actionIcon;
  Widget? title;
  Widget? column;
  Widget? leading;
  bool center;
  Widget? action;
  GestureTapCallback? leadingOnTap;
  GestureTapCallback? actionOnTap;
  double? paddingH;
  PreferredSizeWidget? tabBar;
  bool resizeKeyboard;
  bool height;
Color ?backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor??ColorManager.scaffoldBackGroundColor,
      resizeToAvoidBottomInset: resizeKeyboard,
      appBar: AppBar(
        toolbarHeight: height ? 58 : 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: column ??
            FittedBox(
              fit: BoxFit.scaleDown,
              child: title,
            ),
        centerTitle: center,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leadingWidth: 85,
      ),
      body: SafeArea(
          child: AppPadding(
              padding: EdgeInsets.all(paddingH ?? 16), child: child!)),
      bottomSheet: bottomSheet,
    );
  }
}
