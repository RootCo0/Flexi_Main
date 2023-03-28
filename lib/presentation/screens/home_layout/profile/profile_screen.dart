import 'package:flexi_app/core/local/cache_helper.dart';
import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/helper/route_generator.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/auth/login/login_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/profile/widget/setting_widget.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../widgets/app_body.dart';
import '../home/upgrade_package/widget/package_widget_details.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.packageScreenBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                const SizedBox(
                  height: 245,
                  width: double.infinity,
                ),
                Image.asset(
                  AppImages.backgroundImage,
                  height: 190,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(AppImages.profilePic,
                        height: 115, width: 115, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 5.0,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(ColorManager.primaryColor),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)))),
                    onPressed: () {
                      pushName(context,Routes.editProfileRoute);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.editProfile,
                      style: getSemiBoldStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "طلال إبراهيمي",
                    style: getSemiBoldStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 30),
                  buildPackage(
                      context: context,
                      color: true
                          ? ColorManager.primaryColor
                          : ColorManager.profisionalColor,
                      desc: true
                          ? AppLocalizations.of(context)!.starterPackageSubTitle
                          : AppLocalizations.of(context)!
                              .professionalPackageSubTitle,
                      title: true
                          ? AppLocalizations.of(context)!.starterPackage
                          : AppLocalizations.of(context)!.professionalPackage,
                      logo: true ? AppImages.beginner : AppImages.profisional,
                      subscribed: true),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        SettingWidge(
                          title: AppLocalizations.of(context)!.activeNotifications,
                          image: AppImages.notification,
                          isSwitch: true,
                        ),
                        Divider(
                            height: 1,
                            thickness: 1,
                            color: ColorManager.lightHintColor),
                        SettingWidge(
                          title: AppLocalizations.of(context)!.activeDarkTheme,
                          image: AppImages.theme,
                          isSwitch: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        SettingWidge(
                          title:AppLocalizations.of(context)!.coachMode,
                          image: AppImages.person,
                          isSwitch: false,
                        ),
                        Divider(
                            height: 1,
                            thickness: 1,
                            color: ColorManager.lightHintColor),
                        SettingWidge(
                          title: AppLocalizations.of(context)!.packageStats,
                          image: AppImages.statistic,
                          isSwitch: false,
                        ),
                        Divider(
                            height: 1,
                            thickness: 1,
                            color: ColorManager.lightHintColor),
                        SettingWidge(
                          title:AppLocalizations.of(context)!.paymentInformation,
                          image: AppImages.paymentInfo,
                          isSwitch: false,
                        ),
                        Divider(
                            height: 1,
                            thickness: 1,
                            color: ColorManager.lightHintColor),
                        SettingWidge(
                          onTap: (){
                            pushName(context, Routes.languageRoute);
                          },
                          title:AppLocalizations.of(context)!.language,
                          image: AppImages.language,
                          isSwitch: false,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: SettingWidge(
                      onTap: () {
                        CacheHelper.deleteData(key: "token");
                        popALlAndPushPage(context, LoginScreen());
                      },
                      title:AppLocalizations.of(context)!.logout,
                      image: AppImages.logout,
                      isSwitch: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
