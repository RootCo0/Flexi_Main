import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/home_layout/product_details/product_details.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flutter/material.dart';

class HomeProductItem extends StatelessWidget {
  HomeProductItem(
      {Key? key, this.color, this.image, this.desc, this.price, this.title})
      : super(key: key);
  String? image;
  String? title;
  String? desc;
  String? price;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushPage(context, ProductDetails());
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                height: 175,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: color,
                ),
                child: Image.asset(
                  image!,
                ),
              ),
              Positioned(
                bottom: 5.0,
                right: 5.0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorManager.freeDeliveryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(AppLocalizations.of(context)!.freeDelivery,
                      style: getMediumStyle(
                          fontSize: 8, color: ColorManager.white)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(title!, style: getMediumStyle(fontSize: 10)),
              ),
              Text(price!, style: getSemiBoldStyle(fontSize: 12))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(desc!,
              style:
                  getRegularStyle(fontSize: 9, color: ColorManager.descColor))
        ],
      ),
    );
  }
}
