import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/helper/route_generator.dart';
import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/screens/auth/register/select_birthdate_screen.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_input_text_field.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_password_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class AddUserInfoScreen extends StatefulWidget {
  const AddUserInfoScreen({Key? key}) : super(key: key);

  @override
  State<AddUserInfoScreen> createState() => _AddUserInfoScreenState();
}

class _AddUserInfoScreenState extends State<AddUserInfoScreen> {
  final _countryController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBody(
      resizeKeyboard: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.userInfoTitle,
            style: getSemiBoldStyle(fontSize: 32),
          ),
          const SizedBox(
            height: 50,
          ),
          AppTextInputField(
            keyboardType: TextInputType.name,
            hintText: AppLocalizations.of(context)!.fullName,
            validator: (val) {
              if (val!.isEmpty) {
                return AppLocalizations.of(context)!.enterUrData;
              }
              return null;
            },
            controller: _fullNameController,
          ),
          const SizedBox(
            height:20,
          ),
          AppTextInputField(
            keyboardType: TextInputType.text,
            hintText: AppLocalizations.of(context)!.country,
            validator: (val) {
              if (val!.isEmpty) {
                return AppLocalizations.of(context)!.enterUrData;
              }
              return null;
            },
            controller: _countryController,
          ),
          const SizedBox(
            height:20,
          ),
          AppTextInputField(
            keyboardType: TextInputType.emailAddress,
            hintText: AppLocalizations.of(context)!.email,
            validator: (val) {
              if (val!.isEmpty) {
                return AppLocalizations.of(context)!.enterUrData;
              }
              return null;
            },
            controller: _emailController,
          ),
          const SizedBox(
            height:20,
          ),
          const Spacer(),
          Center(
            child: FloatingActionButton(
              onPressed: () {},
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
