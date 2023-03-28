import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorManager.lightHintColor)),
                child: Row(
                  children: [
                    Container(
                        width: 30,
                        height: 30,
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: ColorManager.categoryBackgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(index == 0
                            ? AppImages.wheyProtine
                            : index == 1
                                ? AppImages.dumbel
                                : AppImages.snikers)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      index == 0
                          ? "مكملات غدائية"
                          : index == 1
                              ? "أدوات رياضية"
                              : "ملابس رياضية",
                      style: getSemiBoldStyle(
                          color: ColorManager.hintColor, fontSize: 13),
                    )
                  ],
                ),
              ),
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          itemCount: 3),
    );
  }
}
