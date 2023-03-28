import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/search_screen.dart';
import 'package:flutter/material.dart';

import '../../../../resources/color_manager.dart';
import '../../../../widgets/app_body.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: (){
        pushPage(context, SearchScreen());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: ColorManager.descColor)),
        child: Row(
          children: [
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.searchText,
                style:
                getRegularStyle(color: ColorManager.descColor, fontSize: 13),
              ),
            ),
            Image.asset(AppImages.filter, color: ColorManager.descColor),
            Icon(
              Icons.search,
              color: ColorManager.descColor,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
