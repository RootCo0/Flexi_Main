import 'package:flexi_app/presentation/screens/auth/register/add_phone_screen.dart';
import 'package:flexi_app/presentation/screens/auth/register/add_user_info_screen.dart';
import 'package:flexi_app/presentation/screens/auth/register/select_birthdate_screen.dart';
import 'package:flexi_app/presentation/screens/auth/register/select_gender_screen.dart';
import 'package:flexi_app/presentation/screens/auth/register/verification_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/home_layout_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/profile/language/language_screen.dart';
import 'package:flutter/material.dart';

import '../resources/app_strings.dart';
import '../screens/auth/login/login_screen.dart';
import '../screens/home_layout/home/upgrade_package/thanks_screen.dart';
import '../screens/home_layout/profile/edit_profile_screen/edit_profile_screen.dart';
import '../screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String oTPRoute = '/oTP';
  static const String phoneRegistrationRoute = '/phoneRegistration';
  static const String homeRoute = '/home';
  static const String genderRoute = '/gender';
  static const String birthDateRoute = '/birthDate';
  static const String thanksRoute = '/thanks';
  static const String addUserInfoRoute = '/addUserInfo';
  static const String editProfileRoute = '/editProfile';
  static const String languageRoute = '/language';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case Routes.phoneRegistrationRoute:
        return MaterialPageRoute(
          builder: (context) => const AddPhoneScreen(),
        );

      case Routes.languageRoute:
        return MaterialPageRoute(
          builder: (context) => const LanguageScreen(),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeLayoutScreen(),
        );

      case Routes.editProfileRoute:
        return MaterialPageRoute(
          builder: (context) => const EditProfileScreen(),
        );

      case Routes.oTPRoute:
        return MaterialPageRoute(
          builder: (context) => const VerificationScreen(),
        );

      case Routes.genderRoute:
        return MaterialPageRoute(
          builder: (context) => const SelectGenderScreen(),
        );
        case Routes.thanksRoute:
        return MaterialPageRoute(
          builder: (context) => const ThanksScreen(),
        );
      case Routes.addUserInfoRoute:
        return MaterialPageRoute(
          builder: (context) => const AddUserInfoScreen(),
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
