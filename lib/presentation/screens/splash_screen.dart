import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flexi_app/core/logic/lang_provider.dart';
import 'package:flexi_app/presentation/screens/auth/login/login_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/home_layout_screen.dart';
import 'package:flexi_app/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:provider/provider.dart';

import '../../core/local/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 1100,
      animationDuration: const Duration(seconds: 2),
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: ColorManager.scaffoldBackGroundColor,
      splash: Provider.of<localeProvider>(context).locale == const Locale("en")
          ? Image.asset(AppImages.splashEnglish)
          : Image.asset(AppImages.splash),
      nextScreen: CacheHelper.getData(key: "onBoarding") == null
          ? const OnBoardingScreen()
          : CacheHelper.getData(key: "token") != null
              ? const HomeLayoutScreen()
              : const LoginScreen(),
    );
  }
}
