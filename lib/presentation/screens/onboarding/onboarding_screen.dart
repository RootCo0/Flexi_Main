import 'package:flexi_app/core/local/cache_helper.dart';
import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/helper/route_generator.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../resources/app_image_paths.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(AppImages.onBoarding),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            AppLocalizations.of(context)!.onBoardingTitle,
            style: getSemiBoldStyle(fontSize: 32),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.onBoardingSubTitle,
            style: getSemiBoldStyle(fontSize: 13),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                pushNameReplacement(context, Routes.loginRoute);
              CacheHelper.putData(key: "onBoarding", value: true);
                },
              backgroundColor: ColorManager.primaryColor,
              child: const Icon(Icons.arrow_forward_ios),
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
