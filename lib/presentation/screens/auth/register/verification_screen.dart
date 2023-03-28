import 'dart:async';

import 'package:flexi_app/presentation/helper/navigator.dart';
import 'package:flexi_app/presentation/helper/route_generator.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:flexi_app/presentation/resources/styles_manager.dart';
import 'package:flexi_app/presentation/widgets/app_body.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_input_text_field.dart';
import 'package:flexi_app/presentation/widgets/form_fields/app_password_input_field.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBody(
        resizeKeyboard: false,
        child: Form(
          key: _formKey,
          child: Column(
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
              PinCodeTextField(
                validator: (v) {
                  if (v!.length < 4) {
                    return AppLocalizations.of(context)!.enterUrData;
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  activeColor: ColorManager.primaryColor,
                  inactiveColor: ColorManager.scaffoldBackGroundColor,
                  disabledColor: ColorManager.primaryColor,
                  activeFillColor: ColorManager.scaffoldBackGroundColor,
                  errorBorderColor: ColorManager.error,
                  inactiveFillColor: ColorManager.scaffoldBackGroundColor,
                  selectedColor: ColorManager.primaryColor,
                  selectedFillColor: ColorManager.scaffoldBackGroundColor,
                  shape: PinCodeFieldShape.circle,
                  // borderRadius: BorderRadius.circular(5),
                  fieldHeight: 75,
                  fieldWidth: 75,
                  // activeFillColor: Colors.white,
                ),
                textStyle: getSemiBoldStyle(
                    color: ColorManager.primaryColor, fontSize: 32),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  return true;
                },
                appContext: context,
              ),
              const Spacer(),
              Center(
                child: FloatingActionButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      pushName(context, Routes.genderRoute);
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
          ),
        ));
  }
}
