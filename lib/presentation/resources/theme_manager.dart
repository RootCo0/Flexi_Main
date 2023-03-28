// import 'package:flutter/material.dart';
// import 'color_manager.dart';
// import 'font_manager.dart';
// import 'styles_manager.dart';
// import 'values_manager.dart';
//
// ThemeData getAppLightTheme(){
//   return ThemeData(
//     scaffoldBackgroundColor:Colors.white ,
//       backgroundColor: Colors.white,
//
//       //main color of the app
//     primaryColor:ColorManager.darkGreen,
//     primaryColorLight: ColorManager.blue,
//     primaryColorDark: ColorManager.darkGreen,
//     disabledColor: ColorManager.grey1,
//     accentColor: ColorManager.grey,
//     //card view theme
//     cardTheme: CardTheme(
//       color: ColorManager.white,
//       shadowColor: ColorManager.grey,
//       elevation: AppSize.s4,
//     ),
//     //appBar theme
//     appBarTheme: AppBarTheme(
//       centerTitle: true,
//       elevation: AppSize.s4,
//       color: ColorManager.darkGreen,
//       shadowColor: ColorManager.blue,
//       titleTextStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s16)
//     ),
//     //button theme
//     buttonTheme: ButtonThemeData(
//       shape: const StadiumBorder(),
//       disabledColor: ColorManager.grey,
//       buttonColor: ColorManager.darkGreen,
//       splashColor: ColorManager.blue,
//     ),
//     //elevated button theme
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         textStyle: getRegularStyle(color: ColorManager.white,fontSize: AppSize.s16),
//         primary: ColorManager.darkGreen,
//         shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12)),
//
//       )
//     ),
//     //text theme
//     textTheme: TextTheme(
//       headline1:getSemiBoldStyle(color: ColorManager.darkGreen,fontSize: FontSize.s16) ,
//       subtitle1:getMediumStyle(color: ColorManager.darkGreen,fontSize: FontSize.s14) ,
//       subtitle2:getMediumStyle(color: ColorManager.darkGreen,fontSize: FontSize.s16) ,
//       caption: getRegularStyle(color: ColorManager.blue),
//       bodyText1:getRegularStyle(color: ColorManager.blue),
//     ),
//     //input decoration theme
//     inputDecorationTheme: InputDecorationTheme(
//       contentPadding:const EdgeInsets.all(AppSize.s8) ,
//       //label style
//       labelStyle: getMediumStyle(color:ColorManager.darkGreen),
//       //hint style
//       hintStyle:  getRegularStyle(color: ColorManager.darkGreen),
//       //error style
//       errorStyle: getRegularStyle(color: ColorManager.error),
//
//       //enable border style
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color:ColorManager.darkGreen ,width: AppSize.s1_5),
//         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//
//       //focus border style
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(color:ColorManager.darkGreen ,width: AppSize.s1_5),
//         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//
//       //error border
//       errorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color:ColorManager.error ,width: AppSize.s1_5),
//         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//
//       //error focused border
//       focusedErrorBorder: OutlineInputBorder(
//         borderSide: BorderSide(color:ColorManager.darkGreen ,width: AppSize.s1_5),
//         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
//       ),
//
//     )
//   );
// }
// // ThemeData getAppDarkTheme(){
// //   return ThemeData(
// //     backgroundColor: Colors.black,
// //     scaffoldBackgroundColor: Colors.black,
// //     //main color of the app
// //     primaryColor:ColorManager.blue,
// //     primaryColorLight: ColorManager.blue,
// //     primaryColorDark: ColorManager.blue,
// //     disabledColor: ColorManager.grey1,
// //     accentColor: ColorManager.grey,
// //     //card view theme
// //     cardTheme: CardTheme(
// //       color: ColorManager.white,
// //       shadowColor: ColorManager.grey,
// //       elevation: AppSize.s4,
// //     ),
// //     //appBar theme
// //     appBarTheme: AppBarTheme(
// //       centerTitle: true,
// //       elevation: AppSize.s8,
// //       color: ColorManager.blue,
// //       shadowColor: ColorManager.blue,
// //       titleTextStyle: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s16)
// //     ),
// //     //button theme
// //     buttonTheme: ButtonThemeData(
// //       shape: const StadiumBorder(),
// //       disabledColor: ColorManager.grey,
// //       buttonColor: ColorManager.blue,
// //       splashColor: ColorManager.blue,
// //     ),
// //     //elevated button theme
// //     elevatedButtonTheme: ElevatedButtonThemeData(
// //       style: ElevatedButton.styleFrom(
// //         textStyle: getRegularStyle(color: ColorManager.white,fontSize: AppSize.s16),
// //         primary: ColorManager.blue,
// //         shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12)),
// //
// //       )
// //     ),
// //     //text theme
// //     textTheme: TextTheme(
// //       headline1:getSemiBoldStyle(color: ColorManager.blueLightGreen,fontSize: FontSize.s16) ,
// //       subtitle1:getMediumStyle(color: ColorManager.blueLightGreen,fontSize: FontSize.s14) ,
// //       subtitle2:getMediumStyle(color: ColorManager.blueLightGreen,fontSize: FontSize.s16) ,
// //       caption: getRegularStyle(color: ColorManager.blueLightGreen),
// //       bodyText1:getRegularStyle(color: ColorManager.blueLightGreen),
// //     ),
// //     //input decoration theme
// //     inputDecorationTheme: InputDecorationTheme(
// //       contentPadding:const EdgeInsets.all(AppSize.s8) ,
// //       //label style
// //       labelStyle: getMediumStyle(color:ColorManager.blue),
// //       //hint style
// //       hintStyle:  getRegularStyle(color: ColorManager.blue),
// //       //error style
// //       errorStyle: getRegularStyle(color: ColorManager.error),
// //
// //       //enable border style
// //       enabledBorder: OutlineInputBorder(
// //         borderSide: BorderSide(color:ColorManager.blue ,width: AppSize.s1_5),
// //         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
// //       ),
// //
// //       //focus border style
// //       focusedBorder: OutlineInputBorder(
// //         borderSide: BorderSide(color:ColorManager.blue ,width: AppSize.s1_5),
// //         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
// //       ),
// //
// //       //error border
// //       errorBorder: OutlineInputBorder(
// //         borderSide: BorderSide(color:ColorManager.error ,width: AppSize.s1_5),
// //         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
// //       ),
// //
// //       //error focused border
// //       focusedErrorBorder: OutlineInputBorder(
// //         borderSide: BorderSide(color:ColorManager.blue ,width: AppSize.s1_5),
// //         borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
// //       ),
// //
// //     )
// //   );
// // }