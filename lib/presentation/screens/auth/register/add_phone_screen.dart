import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/helper/route_generator.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_input_text_field.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_password_input_field.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class AddPhoneScreen extends StatefulWidget {
  const AddPhoneScreen({Key? key}) : super(key: key);

  @override
  State<AddPhoneScreen> createState() => _AddPhoneScreenState();
}

class _AddPhoneScreenState extends State<AddPhoneScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _countryCode = "+966";

   final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBody(
      resizeKeyboard: false,
      child:Form(key: _formKey,child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.enterYourPhone,
            style: getSemiBoldStyle(fontSize: 32),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            AppLocalizations.of(context)!.sendingCodeToVerify,
            style: getSemiBoldStyle(fontSize: 13),
          ),
          const SizedBox(
            height: 50,
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: AppTextInputField(
              keyboardType: TextInputType.phone,

              hintText: AppLocalizations.of(context)!.mobileNumber,
              validator: (val) {
                if (val!.isEmpty) {
                  return AppLocalizations.of(context)!.enterUrData;
                }
                return null;
              },
              prefix: CountryCodePicker(
                flagWidth: 20,
                showFlag: true,
                onChanged: (value) {
                  setState(() {
                    _countryCode = value.dialCode!;
                    print(_countryCode);
                  });
                },
                initialSelection: 'SA',
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
              ),
              controller: _phoneController,
            ),
          ),

           const Spacer(),
          Center(
            child: FloatingActionButton(
              onPressed: () {
                if (_formKey.currentState!.validate()){
                  pushName(context, Routes.oTPRoute);
                }
              },
              backgroundColor: ColorManager.primaryColor,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),)
    );
  }
}
