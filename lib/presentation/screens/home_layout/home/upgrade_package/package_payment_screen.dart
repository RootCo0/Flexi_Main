import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/upgrade_package/add_card_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/upgrade_package/widget/common_widgets.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/upgrade_package/widget/package_widget_details.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/app_main_button.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_input_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../resources/app_image_paths.dart';
import '../../../../widgets/app_button.dart';
import 'widget/select_payment_methodes.dart';

class PackagePaymentScreen extends StatefulWidget {
  PackagePaymentScreen({Key? key, this.isStarted}) : super(key: key);
  bool? isStarted;

  @override
  State<PackagePaymentScreen> createState() => _PackagePaymentScreenState();
}

class _PackagePaymentScreenState extends State<PackagePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBody(
      title: Text(AppLocalizations.of(context)!.payment,
          style: getSemiBoldStyle(fontSize: 14)),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.choosePayment,
                style: getSemiBoldStyle(fontSize: 24)),
            const SizedBox(height: 20),
            Text(AppLocalizations.of(context)!.paymentSubTitle,
                style: getSemiBoldStyle(
                    fontSize: 13, color: ColorManager.descColor)),
            const SizedBox(height: 20),
            if (widget.isStarted != null)
              buildPackage(
                  context: context,
                  color: widget.isStarted!
                      ? ColorManager.primaryColor
                      : ColorManager.profisionalColor,
                  desc: widget.isStarted!
                      ? AppLocalizations.of(context)!.starterPackageSubTitle
                      : AppLocalizations.of(context)!
                          .professionalPackageSubTitle,
                  title: widget.isStarted!
                      ? AppLocalizations.of(context)!.starterPackage
                      : AppLocalizations.of(context)!.professionalPackage,
                  logo: widget.isStarted!
                      ? AppImages.beginner
                      : AppImages.profisional,
                  price: widget.isStarted! ? "130" : "299"),
            const SizedBox(
              height: 20,
            ),
            const SelectPaymentMethods(),
            const SizedBox(
              height: 40,
            ),
            if (widget.isStarted != null)
              Text(AppLocalizations.of(context)!.havingVoucher,
                  style: getSemiBoldStyle(fontSize: 14)),
            if (widget.isStarted != null)
              const SizedBox(
                height: 24,
              ),
            if (widget.isStarted != null)
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
            if (widget.isStarted != null)
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
                pushPage(context, AddCardScreen());
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
