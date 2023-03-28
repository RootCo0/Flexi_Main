import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flexi_app/core/local/cache_helper.dart';
import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/helper/route_generator.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/auth/login/login_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/profile/widget/setting_widget.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/app_dialogs.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_input_text_field.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_password_input_field.dart';
import 'package:flutter/material.dart';

import '../../../../resources/color_manager.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_main_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.packageScreenBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  top: 20,
                  left: 10,
                  child: IconButton(
                      color: ColorManager.white,
                      onPressed: () =>
                          popAllAndPushName(context, Routes.homeRoute),
                      icon: Icon(Icons.arrow_back_ios)),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      "طلال إبراهيمي",
                      style: getSemiBoldStyle(fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.fullName,
                    style: getSemiBoldStyle(fontSize: 12),
                  ),
                  AppTextInputField(
                    hintText: AppLocalizations.of(context)!.fullName,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.job,
                    style: getSemiBoldStyle(fontSize: 12),
                  ),
                  AppTextInputField(
                    hintText: AppLocalizations.of(context)!.job,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.description,
                    style: getSemiBoldStyle(fontSize: 12),
                  ),
                  AppTextInputField(
                    hintText: AppLocalizations.of(context)!.description,
                    maxLines: 6,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.email,
                    style: getSemiBoldStyle(fontSize: 12),
                  ),
                  AppTextInputField(
                    hintText: AppLocalizations.of(context)!.email,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.enterYourPhone,
                    style: getSemiBoldStyle(fontSize: 12),
                  ),
                  AppTextInputField(
                    hintText: AppLocalizations.of(context)!.enterYourPhone,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.currentPassword,
                    style: getSemiBoldStyle(fontSize: 12),
                  ),
                  AppPasswordInputField(
                    hintText: AppLocalizations.of(context)!.currentPassword,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    AppLocalizations.of(context)!.newPassword,
                    style: getSemiBoldStyle(fontSize: 12),
                  ),
                  AppPasswordInputField(
                    hintText: AppLocalizations.of(context)!.newPassword,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppMainButton(
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.BOTTOMSLIDE,
                        body: Padding(
                          padding: EdgeInsets.all(30),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),

                              FittedBox(
                                child: Text(
                                  AppLocalizations.of(context)!.updateDialog,
                                  style: getSemiBoldStyle(fontSize: 24),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              FittedBox(
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .updateDialogSubTitle,
                                  style: getSemiBoldStyle(
                                      fontSize: 14,
                                      color: ColorManager.descColor),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppButton(
                                      onTap:(){
                                       popAllAndPushName(context,Routes.homeRoute);
                                      },
                                      border: BorderRadius.circular(30),

                                      padding: const EdgeInsets.all(10),
                                      color: ColorManager.primaryColor,
                                      child: Text(
                                        AppLocalizations.of(context)!.yes,
                                        style: getSemiBoldStyle(
                                            fontSize: 12,
                                            color: ColorManager.white),
                                        textAlign: TextAlign.center,

                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: AppButton(
                                      onTap:(){
                                        Navigator.of(context).pop();
                                      },
                                      padding: const EdgeInsets.all(10),
                                      border: BorderRadius.circular(30),
                                      color: ColorManager.white,
                                      child: Text(
                                        AppLocalizations.of(context)!.cancel,
                                        style: getSemiBoldStyle(
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.center,

                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        dialogType: DialogType.NO_HEADER,
                      ).show();
                    },
                    color: ColorManager.primaryColor,
                    child: Text(AppLocalizations.of(context)!.update,
                        style: getSemiBoldStyle(
                            color: ColorManager.scaffoldBackGroundColor,
                            fontSize: 14)),
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
