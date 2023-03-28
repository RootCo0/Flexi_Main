import 'package:flexi_app/core/logic/layout/layout_provider.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/widgets/build_main_product.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/widgets/choose_your_coach.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/widgets/home_categories.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/widgets/home_product_item.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/widgets/search_bar.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/widgets/upgrade_package_widget.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBody(
        height: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SearchBar(),
              const SizedBox(
                height: 20,
              ),
              const UpgradePackageWidget(),
              const SizedBox(
                height: 20,
              ),
              const ChooseYourCoachWidget(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.bestProduct,
                    style: getSemiBoldStyle(fontSize: 28),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<LayoutProvider>(context, listen: false)
                          .changeScreen(1);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: ColorManager.lightHintColor),
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        AppLocalizations.of(context)!.viewAll,
                        style: getSemiBoldStyle(
                            fontSize: 10, color: ColorManager.primaryColor),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                      child: HomeProductItem(
                    color: ColorManager.lightYellowProductColor,
                    title: "بروتين عملاق فليكسي برو ماكس",
                    image: AppImages.wheyProtine,
                    price: "\$119.99",
                    desc:
                        "أجزءا من كل عملية تحدث في الجسم. يتكون البروتين من الأحماض الأمينية في تركيبات مختلفة، ولكل نوع منها وظائف مختلفة. بعض ",
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: HomeProductItem(
                          color: ColorManager.lightBlueProductColor,
                          title: " حذاء نايك AIR MAX",
                          image: AppImages.snikers,
                          price: "\319.99",
                          desc:
                              "أجزءا من كل عملية تحدث في الجسم. يتكون البروتين من الأحماض الأمينية في تركيبات مختلفة، ولكل نوع منها وظائف مختلفة. بعض "))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const HomeCategories(),
              const SizedBox(
                height: 20,
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
        ));
  }
}
