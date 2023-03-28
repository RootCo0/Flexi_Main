import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../widgets/app_body.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  Map<String, dynamic> personalInfo = {
    "name": "mohamed ahmed",
    "packageType": "Started Package",
    "verification": "verified",
  };

  @override
  Widget build(BuildContext context) {
    return AppBody(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: QrImage(
                data: jsonEncode(personalInfo),
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
          ),
          const SizedBox(height: 50),
          FittedBox(
            child: Text(AppLocalizations.of(context)!.qrCodeTitle,
                style: getSemiBoldStyle(fontSize: 24)),
          ),
          const SizedBox(height: 32, width: double.infinity),
          Text(
            AppLocalizations.of(context)!.qrCodeSubTitle,
            style:
                getSemiBoldStyle(fontSize: 13, color: ColorManager.descColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
