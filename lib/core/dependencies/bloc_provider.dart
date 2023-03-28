import 'package:flutter/material.dart';
import 'package:flexi_app/core/logic/lang_provider.dart';
 import 'package:flexi_app/core/logic/layout/layout_provider.dart';
 import 'package:provider/provider.dart';

import '../logic/auth/auth_provider.dart';


class AppMainProvider extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const AppMainProvider({this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => localeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LayoutProvider(),
        ),
         ChangeNotifierProvider(create: (context) => AuthProvider()),

      ],
      child: child!,
    );
  }
}
