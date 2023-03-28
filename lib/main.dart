import 'package:flexi_app/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flexi_app/presentation/helper/route_generator.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
 import 'package:provider/provider.dart';
import 'core/dependencies/bloc_provider.dart';
import 'core/local/cache_helper.dart';
import 'core/logic/lang_provider.dart';
import 'core/utilities/network_error_indicator.dart';
import 'l10n/l10n.dart';
import 'core/utilities/data_connection_checker.dart';
import 'core/utilities/data_connectivity_service.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  // inialize object before calling [runApp].
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init(); //localStorage

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    OverlaySupportEntry? entry;
    DataConnectivityService()
        .connectivityStreamController
        .stream
        .listen((event) {
      if (event == DataConnectionStatus.disconnected) {
        entry = showOverlayNotification((context) {
          return NetworkErrorAnimation();
        }, duration: Duration(hours: 1));
      } else {
        if (entry != null) {
          entry?.dismiss();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppMainProvider(
      child: ChangeNotifierProvider(
        create: (context) => localeProvider(),
        builder: (context, child) {
          final provider = Provider.of<localeProvider>(context);

          return OverlaySupport(
              child: MaterialApp(
                supportedLocales: L10n.all,
                locale: provider.locale,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                title: "FitNas",
                debugShowCheckedModeBanner: false,

                // darkTheme: getAppDarkTheme(),
                // theme: getAppLightTheme(),
                theme: ThemeData(fontFamily: FontConstants.fontFamily, primaryColor: ColorManager.primaryColor,appBarTheme:AppBarTheme(iconTheme:IconThemeData(color: Colors.black) )),
                onGenerateRoute: RouteGenerator.getRoute,
                initialRoute: Routes.splashRoute,
              ));
        },
      ),
    );
  }
}
