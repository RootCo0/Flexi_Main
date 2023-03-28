import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/helper/route_generator.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/upgrade_package/thanks_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/upgrade_package/widget/common_widgets.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/upgrade_package/widget/package_widget_details.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/app_main_button.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_input_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../resources/app_image_paths.dart';
import '../../../../widgets/app_button.dart';
import 'widget/select_payment_methodes.dart';

class AddCardScreen extends StatefulWidget {
  AddCardScreen({Key? key, this.isStarted}) : super(key: key);
  bool? isStarted;

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBody(
      title: Text(AppLocalizations.of(context)!.payment,
          style: getSemiBoldStyle(fontSize: 14)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.payWithCard,
                style: getSemiBoldStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.payWithCardSubTitle,
                style: getSemiBoldStyle(
                    fontSize: 13, color: ColorManager.descColor)),
            const SizedBox(height: 40),
            Text(AppLocalizations.of(context)!.email,
                style: getSemiBoldStyle(fontSize: 14)),
            const SizedBox(
              height: 10,
            ),
            AppTextInputField(
                fillColor: ColorManager.textFieldColor,
                hintText: AppLocalizations.of(context)!.email,
                suffixIcon: Icon(Icons.done, color: ColorManager.primaryColor),
                prefix: Icon(Icons.alternate_email_outlined,
                    color: ColorManager.primaryColor)),
            const SizedBox(
              height: 20,
            ),
            Text(AppLocalizations.of(context)!.cardName,
                style: getSemiBoldStyle(fontSize: 14)),
            const SizedBox(
              height: 10,
            ),
            AppTextInputField(
                fillColor: ColorManager.textFieldColor,
                hintText: AppLocalizations.of(context)!.cardName,
                prefix: Icon(Icons.person_outlined,
                    color: ColorManager.primaryColor)),
            const SizedBox(
              height: 20,
            ),
            Text(AppLocalizations.of(context)!.cardInfo,
                style: getSemiBoldStyle(fontSize: 14)),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: AppTextInputField(
                      maxLength: 16,
                      fillColor: ColorManager.textFieldColor,
                      hintText: AppLocalizations.of(context)!.cardNo,
                      prefix: Icon(Icons.credit_card_outlined,
                          color: ColorManager.primaryColor)),
                ),
                Expanded(
                  flex: 2,
                  child: AppTextInputField(
                    maxLength: 4,
                    fillColor: ColorManager.textFieldColor,
                    hintText: AppLocalizations.of(context)!.cardExpire,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AppTextInputField(
                    maxLength: 3,
                    fillColor: ColorManager.textFieldColor,
                    hintText: AppLocalizations.of(context)!.cvc,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            buildKeyValue(
                label: AppLocalizations.of(context)!.delivery, value: "0 SAR"),
            buildKeyValue(
                label: "${AppLocalizations.of(context)!.tax}(10%)",
                value: "10 SAR"),
            buildKeyValue(
                label: "${AppLocalizations.of(context)!.discount}(10%)",
                value: "120 SAR"),
            Divider(height: 1, color: ColorManager.hintColor, thickness: 1),
            const SizedBox(
              height: 10,
            ),
            buildKeyValue(
                isTotal: true,
                label: AppLocalizations.of(context)!.total,
                value: "130 SAR"),
            const SizedBox(
              height: 20,
            ),
            AppMainButton(
              onTap: () {
                popAllAndPushName(context, Routes.thanksRoute);
              },
              color: ColorManager.primaryColor,
              child: Text(AppLocalizations.of(context)!.payNow,
                  style: getSemiBoldStyle(
                      color: ColorManager.scaffoldBackGroundColor,
                      fontSize: 14)),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
