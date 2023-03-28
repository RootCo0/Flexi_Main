import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';

class DeliveryDropDown extends StatefulWidget {
  const DeliveryDropDown({Key? key}) : super(key: key);

  @override
  State<DeliveryDropDown> createState() => _DeliveryDropDownState();
}

class _DeliveryDropDownState extends State<DeliveryDropDown> {
  List<String> delivery = ['توصيل سريع', 'توصيل عادي']; // Option 2
  String? selectedDelivery;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border:
        Border.all(color: ColorManager.primaryColor),
      ),
      child: DropdownButton(
        borderRadius: BorderRadius.circular(15),
        elevation: 0,
        iconDisabledColor: ColorManager.primaryColor,
        iconEnabledColor: ColorManager.primaryColor,
        isExpanded: true,
        underline: const SizedBox(),
        style: getMediumStyle(
            color: ColorManager.fontColor, fontSize: 14),
        hint: Text(AppLocalizations.of(context)!.delivery,
            style: getMediumStyle(
                fontSize: 14,
                color: ColorManager.hintColor)),
        // Not necessary for Option 1
        value: selectedDelivery,
        onChanged: (newValue) {
          setState(() {
            selectedDelivery = newValue as String?;
          });
        },
        items: delivery.map((delivery) {
          return DropdownMenuItem(
            value: delivery,
            child: Text(delivery),
          );
        }).toList(),
      ),
    );
  }
}
