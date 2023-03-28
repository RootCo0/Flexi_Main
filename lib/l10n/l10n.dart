import 'package:flutter/material.dart';
import 'package:flexi_app/core/logic/lang_provider.dart';
import 'package:provider/provider.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('ar'),
    // const Locale('tr'),
  ];

  static String getText(BuildContext context, {String? ar, String? en}) {
    String local = Provider.of<localeProvider>(context).locale.toString();
    String? transalte;
    switch (local) {
      // case "tr":
      //   transalte = tr!;
      //   break;
      case "ar":
        transalte = ar!;
        break;
      default:
        transalte = en!;
    }
    return transalte;
  }
}
