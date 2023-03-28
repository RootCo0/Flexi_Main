import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/helper/route_generator.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/auth/register/select_birthdate_screen.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_input_text_field.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_password_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class SelectGenderScreen extends StatefulWidget {
  const SelectGenderScreen({Key? key}) : super(key: key);

  @override
  State<SelectGenderScreen> createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  bool isMale = false;

  @override
  Widget build(BuildContext context) {
    return AppBody(
      resizeKeyboard: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            isMale
                ? AppLocalizations.of(context)!.maleText
                : AppLocalizations.of(context)!.femaleText,
            style: getSemiBoldStyle(fontSize: 32),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.genderSubTitle,
            style: getSemiBoldStyle(fontSize: 13),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: ColorManager.lightPrimaryColor),
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: !isMale
                              ? ColorManager.primaryColor
                              : ColorManager.lightPrimaryColor),
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            Icon(
                              size: 50,
                              Icons.female,
                              color: !isMale
                                  ? ColorManager.white
                                  : ColorManager.primaryColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppLocalizations.of(context)!.female,
                              style: getSemiBoldStyle(
                                  fontSize: 18,
                                  color: !isMale
                                      ? ColorManager.white
                                      : ColorManager.fontColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: isMale
                              ? ColorManager.primaryColor
                              : ColorManager.lightPrimaryColor),
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            Icon(
                                size: 50,
                                Icons.male,
                                color: isMale
                                    ? ColorManager.white
                                    : ColorManager.primaryColor),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              AppLocalizations.of(context)!.male,
                              style: getSemiBoldStyle(
                                  fontSize: 18,
                                  color: isMale
                                      ? ColorManager.white
                                      : ColorManager.fontColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                pushPage(
                    context,
                    SelectBirtDateScreen(
                      isMale: isMale,
                    ));
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
