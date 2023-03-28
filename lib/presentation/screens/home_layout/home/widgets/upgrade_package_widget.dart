import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/upgrade_package/upgrade_package_screen.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/logic/lang_provider.dart';

class UpgradePackageWidget extends StatelessWidget {
  const UpgradePackageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Provider.of<localeProvider>(context).locale ==
                    const Locale("en")
                ? const AssetImage(AppImages.backgroundPackageEnglish)
                : const AssetImage(AppImages.backgroundPackage),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImages.packagelogo, width: 85, height: 65),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: AppLocalizations.of(context)!.packageTitle,
                      style: getSemiBoldStyle(fontSize: 20)),
                  TextSpan(
                      text: AppLocalizations.of(context)!.packageTitleLevel,
                      style: getSemiBoldStyle(
                          color: ColorManager.primaryColor, fontSize: 20)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  AppLocalizations.of(context)!.packageSubTitle,
                  style: getLightStyle(
                      color: ColorManager.hintColor, fontSize: 12),
                  maxLines: 2,
                )),
                const SizedBox(
                  width: 50,
                ),
                AppButton(
                  onTap: () {
                    showModalBottomSheet(
                       // constraints: BoxConstraints(maxHeight: 800,minHeight: 600),
                      clipBehavior:Clip.antiAliasWithSaveLayer ,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30))),

                      context: context,
                      builder: (_) {
                        return UpgradePackageScreen();
                      },
                    );
                  },
                  padding: EdgeInsets.all(10),
                  color: ColorManager.primaryColor,
                  child: Row(children: [
                    Text(
                      AppLocalizations.of(context)!.upgradePackage,
                      style: getSemiBoldStyle(
                          fontSize: 12, color: ColorManager.white),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: ColorManager.white,
                      size: 15,
                    )
                  ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
