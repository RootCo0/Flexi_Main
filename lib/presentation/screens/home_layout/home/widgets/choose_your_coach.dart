import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/logic/lang_provider.dart';

class ChooseYourCoachWidget extends StatelessWidget {
  const ChooseYourCoachWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child:Row(
        children: [
          Expanded(
            child: Image.asset(AppImages.maleGym),
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    FittedBox(
                      child: Text.rich(
                        maxLines: 2,
                        TextSpan(
                          children: [
                            TextSpan(
                                text: AppLocalizations.of(context)!
                                    .homeCoachTitle,
                                style: getSemiBoldStyle(fontSize: 20)),
                            TextSpan(
                                text: AppLocalizations.of(context)!
                                    .homeCoachTitleImmediately,
                                style: getSemiBoldStyle(
                                    color: ColorManager.primaryColor,
                                    fontSize: 20)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppLocalizations.of(context)!.homeCoachSubTitle,
                      style: getLightStyle(
                          color: ColorManager.hintColor, fontSize: 12),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppButton(
                      onTap: () {},
                      padding: const EdgeInsets.all(10),
                      color: ColorManager.primaryColor,
                      child: Row(children: [
                        Expanded(
                            child: FittedBox(
                              child: Text(
                                AppLocalizations.of(context)!.hireTrainer,
                                style: getSemiBoldStyle(
                                    fontSize: 12, color: ColorManager.white),
                              ),
                            )),
                        Icon(
                          Icons.arrow_forward,
                          color: ColorManager.white,
                          size: 15,
                        )
                      ]),
                    )
                  ],
                ),
              )),
        ],
      )
    );
  }
}
