import 'package:flutter/material.dart';

import '../../../../../resources/color_manager.dart';
import '../../../../../resources/styles_manager.dart';

buildPropertiesOfPackage({bool? isContained, String? label}) {
  return Container(
    margin: const EdgeInsets.only(bottom:10),
    child: Row(
      children: [
        CircleAvatar(
          radius: 8,
          backgroundColor:
          isContained! ? ColorManager.primaryColor : ColorManager.descColor,
          child: const Icon(
            Icons.done,
            color: Colors.white,
            size: 12,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        FittedBox(
          child: Text(
            label!,
            style: getSemiBoldStyle(fontSize: 12),
          ),
        )
      ],
    ),
  );
}
buildKeyValue({String? label, String? value, bool isTotal = false}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label!,
            style: getSemiBoldStyle(
                fontSize: isTotal ? 20 : 13,
                color:
                isTotal ? ColorManager.fontColor : ColorManager.descColor)),
        Text(value!,
            style: getSemiBoldStyle(
                fontSize: isTotal ? 20 : 13,
                color:
                isTotal ? ColorManager.fontColor : ColorManager.descColor)),
      ],
    ),
  );
}
