import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flutter/material.dart';

import '../../../../helper/navigator.dart';
import '../../../../resources/app_image_paths.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../widgets/app_button.dart';
import '../../../../widgets/app_main_button.dart';
import '../../../../widgets/form_fields/app_input_text_field.dart';
import '../../home/upgrade_package/package_payment_screen.dart';
import '../../home/upgrade_package/widget/common_widgets.dart';
import '../../home/widgets/build_main_product.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  List<String> address = [
    ' رقم 9 مكة  حي 379',
    ' رقم 9 المدينه حي 3322',
    ' رقم 9 مكة جده حي 379',
    ' رقم 9 الرياض حي 379'
  ]; // Option 2
  String? selectAddress;

  @override
  Widget build(BuildContext context) {
    return AppBody(
      title: Text(AppLocalizations.of(context)!.cart, style: getSemiBoldStyle(fontSize: 14)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(height: 1, thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(AppImages.packagelogo,
                      width: 30, height: 30, fit: BoxFit.cover),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(AppLocalizations.of(context)!.deliveredTo, style: getSemiBoldStyle(fontSize: 11)),
                const SizedBox(
                  width: 80,
                ),
                Expanded(
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 0,
                    iconDisabledColor: ColorManager.primaryColor,
                    iconEnabledColor: ColorManager.primaryColor,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: getMediumStyle(
                        color: ColorManager.fontColor, fontSize: 14),
                    hint: Text(AppLocalizations.of(context)!.address,
                        style: getMediumStyle(
                            fontSize: 14, color: ColorManager.hintColor)),
                    // Not necessary for Option 1
                    value: selectAddress,
                    onChanged: (newValue) {
                      setState(() {
                        selectAddress = newValue as String?;
                      });
                    },
                    items: address.map((address) {
                      return DropdownMenuItem(
                        value: address,
                        child: FittedBox(child: Text(address)),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            const Divider(height: 1, thickness: 1),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => BuildMainProduct(
                      inCard: true,
                      color: index % 2 == 0
                          ? ColorManager.lightYellowProductColor
                          : ColorManager.lightBlueProductColor,
                      title: index % 2 != 0
                          ? "حذاء نايك AIR MAX"
                          : "بروتين عملاق فليكسي برو ماكس",
                      image: index % 2 != 0
                          ? AppImages.snikers
                          : AppImages.wheyProtine,
                      price: "\$119.99",
                      desc:
                          "أجزءا من كل عملية تحدث في الجسم. يتكون البروتين من الأحماض الأمينية في تركيبات مختلفة، ولكل نوع منها وظائف مختلفة. بعض ",
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                itemCount: 2),
            const SizedBox(
              height: 24,
            ),
            Text(AppLocalizations.of(context)!.havingVoucher,
                style: getSemiBoldStyle(fontSize: 14)),
            const SizedBox(
              height: 24,
            ),
            AppTextInputField(
              fillColor: ColorManager.textFieldColor,
              hintText: AppLocalizations.of(context)!.voucher,
              suffixIcon: Container(
                margin: EdgeInsets.all(7),
                child: AppButton(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  color: ColorManager.primaryColor,
                  child: Text(AppLocalizations.of(context)!.apply,
                      style: getSemiBoldStyle(
                          fontSize: 14, color: ColorManager.white)),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            buildKeyValue(
                label: AppLocalizations.of(context)!.delivery, value: "0 SAR"),
            buildKeyValue(
                label: "${AppLocalizations.of(context)!.tax}(10%)",
                value: "10 SAR"),
            buildKeyValue(
                label: "${AppLocalizations.of(context)!.discount}(10%)",
                value: "120 SAR"),
            Divider(height: 1, color: ColorManager.hintColor),
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
                pushPage(context,PackagePaymentScreen());
              },
              color: ColorManager.primaryColor,
              child: Text(AppLocalizations.of(context)!.payNow,
                  style: getSemiBoldStyle(
                      color: ColorManager.scaffoldBackGroundColor,
                      fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
