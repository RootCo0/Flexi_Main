import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flutter/material.dart';

import '../../../../resources/color_manager.dart';
import '../../../../resources/styles_manager.dart';
import '../../../../widgets/app_body.dart';

 class BuildMainProduct extends StatefulWidget {
  BuildMainProduct(
      {Key? key, this.color, this.image, this.desc, this.price, this.title,this.inCard=false})
      : super(key: key);
  String? image;
  bool? inCard;
  String? title;
  String? desc;
  String? price;
  Color? color;
  @override
  State<BuildMainProduct> createState() => _BuildMainProductState();
}

class _BuildMainProductState extends State<BuildMainProduct> {
   int counter=1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: widget.color,
          ),
          child: Image.asset(
            widget.image!,
          ),
        ),
        const SizedBox(
          width: 13,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                        widget.title!, style: getSemiBoldStyle(fontSize: 14)),
                  ),
                  Expanded(
                    child: Text(
                        widget.price!, style: getSemiBoldStyle(fontSize: 14)),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(widget.desc!,
                  style: getRegularStyle(
                      fontSize: 9, color: ColorManager.descColor)),
              const SizedBox(
                height: 5,
              ),
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
                            fontSize: 9, color: ColorManager.white)),
                  ),
                  if(widget.inCard!)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            counter++;
                          });
                        },
                        child: Image.asset(AppImages.plus),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "$counter",
                          style: getSemiBoldStyle(fontSize: 13),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if(counter>0) {
                              counter--;
                            }
                          });
                        },
                        child: Image.asset(AppImages.minus),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
