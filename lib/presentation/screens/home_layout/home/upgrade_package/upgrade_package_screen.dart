import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/upgrade_package/plan_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/upgrade_package/widget/package_widget_details.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/app_main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/logic/layout/layout_provider.dart';
import '../../../../helper/navigator.dart';
import '../../../../widgets/app_button.dart';

class UpgradePackageScreen extends StatefulWidget {
  const UpgradePackageScreen({Key? key}) : super(key: key);

  @override
  State<UpgradePackageScreen> createState() => _UpgradePackageScreenState();
}

class _UpgradePackageScreenState extends State<UpgradePackageScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBody(
      backgroundColor: ColorManager.packageScreenBackgroundColor,
      height: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.choosePackage,
            style: getSemiBoldStyle(fontSize: 28),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.choosePackageSubtitle,
            style:
                getSemiBoldStyle(fontSize: 13, color: ColorManager.descColor),
          ),
          const SizedBox(
            height: 30,
          ),
          PackageWidgetDetails(index: 1),
          const SizedBox(
            height: 15,
          ),
          PackageWidgetDetails(index: 2),
          const Spacer(),
          AppMainButton(
            onTap: () {
              if (Provider.of<LayoutProvider>(context,listen: false).selected != -1) {
                pushPage(context, PlanScreen(isStarted: Provider.of<LayoutProvider>(context,listen: false).selected == 1,));
              }
            },
            padding: const EdgeInsets.symmetric(vertical: 17),
            color: ColorManager.primaryColor,
            child: Text(
              AppLocalizations.of(context)!.continueToUpgrade,
              style: getSemiBoldStyle(fontSize: 14, color: ColorManager.white),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
