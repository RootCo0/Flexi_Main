import 'package:flexi_app/presentation/screens/home_layout/chat/chat_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/home/home_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/market/market_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/profile/profile_screen.dart';
import 'package:flexi_app/presentation/screens/home_layout/scan/scan_screen.dart';
import 'package:flutter/material.dart';

import '../../utilities/api_path.dart';
import '../../utilities/api_service.dart';

class LayoutProvider extends ChangeNotifier {
  List<Widget> screens = [
    HomeScreen(),
    MarketScreen(),
    ScanScreen(),
    ChatScreen(),
    ProfileScreen()
  ];
  int screenIndex = 0;

  void changeScreen(int index) {
    screenIndex = index;
    notifyListeners();
  }
  int selected=-1;
  void changePackage(int index) {
    selected = index;
    notifyListeners();
  }
}
