import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/app_main_button.dart';
import 'package:flutter/material.dart';

import '../../../../helper/navigator.dart';
import '../../../../helper/route_generator.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppImages.verification),
          const SizedBox(height: 32),
          FittedBox(
            child: Text(AppLocalizations.of(context)!.ourEnd,
                style: getSemiBoldStyle(fontSize: 24)),
          ),
          const SizedBox(height: 32),
          Text(AppLocalizations.of(context)!.ourEndSubTitle,
              style:
                  getSemiBoldStyle(fontSize: 13, color: ColorManager.descColor),
              textAlign: TextAlign.center),
          const Spacer(),
          AppMainButton(
            onTap: (){
              popAllAndPushName(context, Routes.homeRoute);

            },
            color: ColorManager.primaryColor,
            child: Text(AppLocalizations.of(context)!.startNow,
                style: getSemiBoldStyle(
                    color: ColorManager.scaffoldBackGroundColor, fontSize: 14)),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
