import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';

class SizeDropDown extends StatefulWidget {
  const SizeDropDown({Key? key}) : super(key: key);

  @override
  State<SizeDropDown> createState() => _SizeDropDownState();
}

class _SizeDropDownState extends State<SizeDropDown> {
  List<String> size = ['41', '42', '43', '44', '45']; // Option 2
  String? selectSize;
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
        hint: Text(AppLocalizations.of(context)!.size,
            style: getMediumStyle(
                fontSize: 14,
                color: ColorManager.hintColor)),
        // Not necessary for Option 1
        value: selectSize,
        onChanged: (newValue) {
          setState(() {
            selectSize = newValue as String?;
          });
        },
        items: size.map((size) {
          return DropdownMenuItem(
            value: size,
            child: Text(size),
          );
        }).toList(),
      ),
    );
  }
}
