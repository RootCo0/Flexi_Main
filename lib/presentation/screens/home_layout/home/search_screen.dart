import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/widgets/build_main_product.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/widgets/home_categories.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_input_text_field.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        children: [
          AppTextInputField(
            borderRadius: 30,
            borderColor: ColorManager.descColor,
            hintText: AppLocalizations.of(context)!.searchText,
            suffixIcon: Icon(
              Icons.search,
              color: ColorManager.descColor,
              size: 25,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.results,
                style: getSemiBoldStyle(fontSize: 28),
              ),
              Text(
                "${AppLocalizations.of(context)!.matchingResults} (12)",
                style: getSemiBoldStyle(
                    fontSize: 15, color: ColorManager.descColor),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const HomeCategories(),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
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
                itemCount: 12),
          )
        ],
      ),
    );
  }
}
