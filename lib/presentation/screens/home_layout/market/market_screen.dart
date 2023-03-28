import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/widgets/home_categories.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/widgets/home_product_item.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/widgets/search_bar.dart';
import 'package:flexi_app/presentation/screens/home_layout/product_details/card/card_screen.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBody(
        height: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBar(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.market,
                    style: getSemiBoldStyle(fontSize: 28),
                  ),
                  GestureDetector(
                    onTap: () {
                      pushPage(context, CardScreen());
                    },
                    child: const Icon(
                      Icons.shopping_cart_checkout,
                    ),
                  )
                ],
              ),
              const HomeCategories(),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                itemCount: 11,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => HomeProductItem(
                  color: ColorManager.lightYellowProductColor,
                  title: "بروتين عملاق فليكسي برو ماكس",
                  image: AppImages.wheyProtine,
                  price: "\$119.99",
                  desc:
                      "أجزءا من كل عملية تحدث في الجسم. يتكون البروتين من الأحماض الأمينية في تركيبات مختلفة، ولكل نوع منها وظائف مختلفة. بعض ",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
