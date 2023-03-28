import 'package:flexi_app/presentation/resources/app_image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flexi_app/core/local/cache_helper.dart';
import 'package:flexi_app/core/logic/layout/layout_provider.dart';
import 'package:flexi_app/presentation/resources/color_manager.dart';
import 'package:provider/provider.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<LayoutProvider>(context)
          .screens[Provider.of<LayoutProvider>(context).screenIndex],

      bottomNavigationBar: SweetNavBar(
        height: 80,
        paddingGradientColor: const LinearGradient(
            colors: [Color.fromARGB(0, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)]),
        currentIndex: Provider.of<LayoutProvider>(context).screenIndex,
        paddingBackgroundColor: ColorManager.scaffoldBackGroundColor,
        items: [
          SweetNavBarItem(
            sweetIcon: Icon(Icons.home_outlined),
            sweetActive: Icon(Icons.home_outlined, color: ColorManager.fontColor),
            sweetLabel: 'home',
          ),
          SweetNavBarItem(
              sweetIcon: const Icon(Icons.shopping_bag_outlined),
              sweetActive: Icon(Icons.shopping_bag_outlined, color: ColorManager.fontColor),
              sweetLabel: 'market'),
          SweetNavBarItem(
              sweetIcon: Image.asset(AppImages.scan), sweetLabel: 'scan'),
          SweetNavBarItem(
            sweetIcon: const Icon(Icons.chat_outlined),
            sweetLabel: 'chat',
            sweetActive: Icon(Icons.chat_outlined, color: ColorManager.fontColor),
          ),
          SweetNavBarItem(
            sweetIcon: const Icon(Icons.person_outlined),
            sweetLabel: 'profile',
            sweetActive: Icon(Icons.person_outlined, color: ColorManager.fontColor),
          ),
        ],
        onTap: (index) {
          Provider.of<LayoutProvider>(context, listen: false)
              .changeScreen(index);
        },
      ),
      // BottomNavigationBar(
      //     currentIndex: Provider.of<LayoutProvider>(context).screenIndex,
      //     // type: BottomNavigationBarType.fixed,
      //     onTap: (index) {
      //       Provider.of<LayoutProvider>(context, listen: false)
      //           .changeScreen(index);
      //     },
      //     unselectedItemColor: ColorManager.grey,
      //     selectedItemColor: ColorManager.primaryColor,
      //     items: const [
      //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.chat), label: "الاشتراكات"),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.favorite_outlined), label: "المطاعم"),
      //       BottomNavigationBarItem(icon: Icon(Icons.person), label: "الحساب"),
      //     ]),
    );
  }
}
