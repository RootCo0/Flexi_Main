import 'package:flexi_app/core/logic/lang_provider.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBody(
      title: Text(AppLocalizations.of(context)!.language,
          style: getSemiBoldStyle(fontSize: 14)),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Provider.of<localeProvider>(context,listen: false).changeLang("ar");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(AppImages.arabic, width: 20, height: 20),
                  SizedBox(
                    width: 20,
                  ),
                  Text(AppLocalizations.of(context)!.arabic,
                      style: getSemiBoldStyle(fontSize: 14))
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Provider.of<localeProvider>(context,listen: false).changeLang("en");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(AppImages.english, width: 20, height: 20),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(AppLocalizations.of(context)!.english,
                      style: getSemiBoldStyle(fontSize: 14))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
