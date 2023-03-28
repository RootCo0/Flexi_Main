import 'package:flexi_app/core/logic/layout/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../resources/app_image_paths.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/styles_manager.dart';
import '../../../../../widgets/app_body.dart';

class PackageWidgetDetails extends StatefulWidget {
  PackageWidgetDetails({Key? key, this.index}) : super(key: key);
  int? index;

  @override
  State<PackageWidgetDetails> createState() => _PackageWidgetDetailsState();
}

class _PackageWidgetDetailsState extends State<PackageWidgetDetails> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Provider.of<LayoutProvider>(context, listen: false)
              .changePackage(widget.index!);
        },
        child: buildPackage(
            context: context,
            color: Provider.of<LayoutProvider>(context).selected == widget.index
                ? ColorManager.primaryColor
                : ColorManager.scaffoldBackGroundColor,
            desc: widget.index == 1
                ? AppLocalizations.of(context)!.starterPackageSubTitle
                : AppLocalizations.of(context)!.professionalPackageSubTitle,
            title: widget.index == 1
                ? AppLocalizations.of(context)!.starterPackage
                : AppLocalizations.of(context)!.professionalPackage,
            logo:
                widget.index == 1 ? AppImages.beginner : AppImages.profisional,
            price: widget.index == 1 ? "130" : "299"));
  }
}

buildPackage(
    {String? title,
    String? desc,
    String? price,
    String? logo,
    Color? color,
    bool subscribed = false,
    required BuildContext context}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color!, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(logo!),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: getSemiBoldStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  desc!,
                  style: getSemiBoldStyle(
                      fontSize: 9, color: ColorManager.descColor),
                ),
              ],
            ),
          ),
          subscribed
              ? Container(
            padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorManager.lightPrimaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text("تم الإشتراك",
                      style: getSemiBoldStyle(
                          fontSize: 10, color: ColorManager.primaryColor)),
                )
              : Text(
                  "${price}SAR/${AppLocalizations.of(context)!.monthly} ",
                  style: getSemiBoldStyle(fontSize: 14),
                ),
        ],
      ),
    ),
  );
}
