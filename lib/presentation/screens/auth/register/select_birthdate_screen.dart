import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/helper/route_generator.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_input_text_field.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_password_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:intl/intl.dart';

class SelectBirtDateScreen extends StatefulWidget {
  SelectBirtDateScreen({Key? key, this.isMale}) : super(key: key);
  bool? isMale;

  @override
  State<SelectBirtDateScreen> createState() => _SelectBirtDateScreenState();
}

class _SelectBirtDateScreenState extends State<SelectBirtDateScreen> {
  String? birthDate;

  @override
  Widget build(BuildContext context) {
    return AppBody(
      resizeKeyboard: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.isMale!
                ? AppLocalizations.of(context)!.maleBirtDateText
                : AppLocalizations.of(context)!.femaleBirtDateText,
            style: getSemiBoldStyle(fontSize: 32),
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(onPressed: () async {
            DateTime? dateTime = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100));
            setState(() {
              birthDate = DateFormat('dd-MM-yyyy').format(dateTime!);
            });
          }, child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: ColorManager.primaryColor),
            ),
            child: Text(birthDate != null ? birthDate! : AppLocalizations.of(context)!.birthDate,
                style: getSemiBoldStyle(fontSize: 18)),
          ),),
          const Spacer(),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                pushName(context, Routes.addUserInfoRoute);
              },
              backgroundColor: ColorManager.primaryColor,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
