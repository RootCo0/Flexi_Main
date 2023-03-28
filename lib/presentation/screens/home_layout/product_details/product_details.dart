import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/screens/home_layout/product_details/card/card_screen.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flutter/material.dart';

import '../../../helper/navigator.dart';
import '../../../resources/styles_manager.dart';
import '../../../widgets/app_main_button.dart';
import '../home/upgrade_package/add_card_screen.dart';
import '../home/widgets/build_main_product.dart';
import 'widget/delivevry_drop_down.dart';
import 'widget/quantity_drop_down.dart';
import 'widget/size_drop_down.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectImage = 0;
  List<String> images = [
    AppImages.snikers,
    AppImages.dumbel,
    AppImages.wheyProtine,
    AppImages.waterBottel,
  ];
  List<Color> colors = [
    ColorManager.primaryColor,
    ColorManager.lightBlueProductColor,
    ColorManager.lightYellowProductColor,
    ColorManager.error,
  ]; // Option 2

  int selectedColor = 0;
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return AppBody(
      paddingH: 0,
      title: Text("حذاء نايك AIR MAX", style: getSemiBoldStyle(fontSize: 14)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(70),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  color: colors[selectedColor],
                  child: Image.asset(
                    images[selectImage],
                  ),
                ),
                Positioned(
                    top: 5.0,
                    right: 5.0,
                    child: Column(
                        children: List.generate(
                      images.length,
                      (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectImage = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            height: 55,
                            width: 55,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              images[index],
                            ),
                          )),
                    )))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: ColorManager.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(AppLocalizations.of(context)!.freeDelivery,
                            style: getMediumStyle(
                                fontSize: 11, color: ColorManager.white)),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                        child: Container(
                            alignment: AlignmentDirectional.center,
                            width: 32,
                            height: 32,
                            // padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: ColorManager.descColor)),
                            child: Icon(
                              Icons.favorite,
                              color: isFav
                                  ? ColorManager.error
                                  : ColorManager.descColor,
                              size: 20,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text("حذاء نايك AIR MAX",
                      style: getSemiBoldStyle(fontSize: 18)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "أجزءا من كل عملية تحدث في الجسم. يتكون البروتين من الأحماض الأمينية في تركيبات مختلفة، ولكل نوع منها وظائف مختلفة. بعض يبات مختلفة، ولكل نوع من أجزءا من كل عملية تحدث في الجسم. يتكون البروتين من الأحماض الأمينية في تركيبات مختلفة، ولكل نوع نه....",
                    style: getSemiBoldStyle(
                        fontSize: 11, color: ColorManager.descColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$319.99",
                        style: getSemiBoldStyle(fontSize: 24),
                      ),
                      Row(
                        children: List.generate(
                            colors.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedColor = index;
                                    });
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: ColorManager.white,
                                        border: Border.all(
                                            color: index == selectedColor
                                                ? ColorManager.descColor
                                                : ColorManager.white),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: CircleAvatar(
                                          radius: 11,
                                          backgroundColor: colors[index])),
                                )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: ColorManager.lightHintColor,
                    height: 2,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: SizeDropDown(),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: QuantityDropDown(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Expanded(
                        child: DeliveryDropDown(),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(child: SizedBox()),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppMainButton(
                    onTap: () {
                      pushPage(context, CardScreen());
                    },
                    color: ColorManager.primaryColor,
                    child: Text(AppLocalizations.of(context)!.addToCart,
                        style: getSemiBoldStyle(
                            color: ColorManager.scaffoldBackGroundColor,
                            fontSize: 14)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    AppLocalizations.of(context)!.similarProducts,
                    style: getSemiBoldStyle(fontSize: 28),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => BuildMainProduct(
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
                      itemCount: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
