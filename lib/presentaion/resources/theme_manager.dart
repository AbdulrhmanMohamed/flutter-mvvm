import 'package:flutter/material.dart';
import 'package:new_flutter/presentaion/resources/color_manager.dart';
import 'package:new_flutter/presentaion/resources/font_manager.dart';
import 'package:new_flutter/presentaion/resources/styles_manager.dart';
import 'package:new_flutter/presentaion/resources/values_manager.dart';

ThemeData getAppThemeData() {
  return ThemeData(
    // color theme
    primaryColor: ColorManager.primaryColor,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary, // repel effect
    // card view theme
//====================================================================================
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

//======================================================================================
    // appbar theme

    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primaryColor,
      shadowColor: ColorManager.lightPrimary,
      elevation: AppSize.s4,
      titleTextStyle: getRegularTextStyle(
          fontSize: FontSize.s16, color: ColorManager.white),
    ),

//============================================
    // button theme

    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primaryColor,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary,
    ),

    //========================================
    // elevated button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorManager.primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
        textStyle: getRegularTextStyle(
            color: ColorManager.white, fontSize: FontSize.s17),
      ),
    ),

//===================================================================================
// text Theme
    textTheme: TextTheme(
        headlineSmall: getRegularTextStyle(
            color: ColorManager.lightGrey, fontSize: FontSize.s14),
        headlineMedium: getMediumTextStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16),
        displayMedium: getSemiBoldTextStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s14),
        headlineLarge: getBoldTextStyle(
            color: ColorManager.white, fontSize: FontSize.s22)),

//========================================================
// input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      hintStyle:
          getRegularTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle:
          getMediumTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      errorStyle: getRegularTextStyle(
          color: ColorManager.error, fontSize: FontSize.s14),
          // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primaryColor, width: AppSize.s1_5),
            borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      

       focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
            borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

       errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

       focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primaryColor, width: AppSize.s1_5),
            borderRadius:const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
