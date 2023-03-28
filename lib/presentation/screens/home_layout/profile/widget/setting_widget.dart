import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
 import 'package:flutter/material.dart';

class SettingWidge extends StatefulWidget {
  SettingWidge({Key? key, this.isSwitch, this.title, this.image, this.onTap})
      : super(key: key);
  String? image;
  String? title;
  bool? isSwitch;
  GestureTapCallback? onTap;

  @override
  State<SettingWidge> createState() => _SettingWidgeState();
}

class _SettingWidgeState extends State<SettingWidge> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            Image.asset(widget.image!,height: 25,width: 25,),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                widget.title!,
                style: getSemiBoldStyle(fontSize: 13),
              ),
            ),
            if (widget.isSwitch!)
              Switch(
                  activeColor: ColorManager.primaryColor,
                  value: isOn,
                  onChanged: (value) {
                    setState(() {
                      isOn = value;
                    });
                  })
          ],
        ),
      ),
    );
  }
}
