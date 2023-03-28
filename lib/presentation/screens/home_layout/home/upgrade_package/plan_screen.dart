import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/upgrade_package/widget/common_widgets.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flutter/material.dart';

import '../../../../resources/color_manager.dart';
import '../../../../widgets/app_main_button.dart';
import 'package_payment_screen.dart';

class PlanScreen extends StatelessWidget {
  PlanScreen({Key? key, this.isStarted}) : super(key: key);
  bool? isStarted;

  @override
  Widget build(BuildContext context) {
    return AppBody(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: isStarted!?ColorManager.primaryColor:ColorManager.profisionalColor, width: 3)),
                child: Image.asset( isStarted!?AppImages.beginner:AppImages.profisional,
                    width: 50, height: 50, fit: BoxFit.fill),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                isStarted!
                    ? AppLocalizations.of(context)!.starterPackage
                    : AppLocalizations.of(context)!.professionalPackage,
                style: getSemiBoldStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                isStarted!
                    ? AppLocalizations.of(context)!.packageFeaturesStartedSubTitle
                    : AppLocalizations.of(context)!.packageFeaturesProfSubTitle ,
                style: getSemiBoldStyle(
                    fontSize: 9, color: ColorManager.descColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
              Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    AppLocalizations.of(context)!.packageFeatures,
                    style: getSemiBoldStyle(fontSize: 16),
                  )),
              const SizedBox(
                height: 10,
              ),
              buildPropertiesOfPackage(
                  label:  AppLocalizations.of(context)!.feature1,
                  isContained: true),
              buildPropertiesOfPackage(
                  label:  AppLocalizations.of(context)!.feature2,
                  isContained: true),
              buildPropertiesOfPackage(
                  label:  AppLocalizations.of(context)!.feature3,
                  isContained: true),
              buildPropertiesOfPackage(
                  label:  AppLocalizations.of(context)!.feature4,
                  isContained: true),
              buildPropertiesOfPackage(
                  label:  AppLocalizations.of(context)!.feature5,
                  isContained: true),
              buildPropertiesOfPackage(
                  label:  AppLocalizations.of(context)!.feature6,
                  isContained:!isStarted!),
              buildPropertiesOfPackage(
                  label:  AppLocalizations.of(context)!.feature7,
                  isContained: !isStarted!),
              buildPropertiesOfPackage(
                  label:  AppLocalizations.of(context)!.feature8,
                  isContained: !isStarted!),
              buildPropertiesOfPackage(
                  label:  AppLocalizations.of(context)!.feature9,
                  isContained: !isStarted!),
              const SizedBox(
                height: 30,
              ),
              AppMainButton(
                onTap: () {
                  pushPage(context, PackagePaymentScreen(isStarted:isStarted));
                },
                padding: const EdgeInsets.symmetric(vertical: 17),
                color: ColorManager.primaryColor,
                child: Text(
                    "${isStarted! ? "130" : "299"}SAR/${AppLocalizations.of(context)!.monthly} ",
                  style: getSemiBoldStyle(
                      fontSize: 14, color: ColorManager.white),
                ),
              ),
            ],
          ),
        ));
  }
}
