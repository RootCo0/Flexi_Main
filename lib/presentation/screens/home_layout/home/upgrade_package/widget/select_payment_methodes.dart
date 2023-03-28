import 'package:flutter/material.dart';

import '../../../../../resources/app_image_paths.dart';
import '../../../../../resources/color_manager.dart';

class SelectPaymentMethods extends StatefulWidget {
  const SelectPaymentMethods({Key? key}) : super(key: key);

  @override
  State<SelectPaymentMethods> createState() => _SelectPaymentMethodsState();
}

class _SelectPaymentMethodsState extends State<SelectPaymentMethods> {
  List<String> paymentLogos = [
    AppImages.paypal,
    AppImages.visa,
    AppImages.masterCard,
    AppImages.applePay,
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: List.generate(
            paymentLogos.length,
            (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = index;
                    });
                  },
                  child: Container(
                    height: 70,
                    width: (MediaQuery.of(context).size.width - 40 - 32) * 0.5,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: ColorManager.paymentColor,
                      border: Border.all(color: ColorManager.descColor),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              color: ColorManager.scaffoldBackGroundColor,
                              borderRadius: BorderRadius.circular(100),
                              border:
                                  Border.all(color: ColorManager.descColor)),
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: selected == index
                                ? ColorManager.primaryColor
                                : ColorManager.paymentColor,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          paymentLogos[index],
                        )
                      ],
                    ),
                  ),
                )));
  }
}
