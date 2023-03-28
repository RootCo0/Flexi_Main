import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';

class QuantityDropDown extends StatefulWidget {
  const QuantityDropDown({Key? key}) : super(key: key);

  @override
  State<QuantityDropDown> createState() => _QuantityDropDownState();
}

class _QuantityDropDownState extends State<QuantityDropDown> {
  List<String> count = ['1', '2', '3']; // Option 2
  String? selectQuantitiy;
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
        hint: Text(AppLocalizations.of(context)!.quantity,
            style: getMediumStyle(
                fontSize: 14,
                color: ColorManager.hintColor)),
        // Not necessary for Option 1
        value: selectQuantitiy,
        onChanged: (newValue) {
          setState(() {
            selectQuantitiy = newValue as String?;
          });
        },
        items: count.map((quantity) {
          return DropdownMenuItem(
            value: quantity,
            child: Text(quantity),
          );
        }).toList(),
      ),
    );
  }
}
