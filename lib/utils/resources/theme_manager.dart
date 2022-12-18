
import 'package:flutter/material.dart';
import 'package:wakoody/utils/resources/color_manager.dart';
import 'package:wakoody/utils/resources/font_manager.dart';
import 'package:wakoody/utils/resources/styles_manager.dart';
import 'package:wakoody/utils/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      // ripple color
      splashColor: ColorManager.primary,
      // cursor Style
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorManager.primary
      ),
      // will be used incase of disabled button for example
      accentColor: ColorManager.grey,
      // card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4),
      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.primaryOpacity70,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16)),
      // Button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primaryOpacity70),

      // text button theme
      textButtonTheme:  TextButtonThemeData(
        style:  TextButton.styleFrom(
            textStyle: getRegularStyle(color: ColorManager.primary , fontSize: FontSize.s16),
                primary: ColorManager.primary
        )
      ),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getBoldStyle(color: ColorManager.white , fontSize: AppSize.s18),
              primary: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s30)))),

      // icon theme
      iconTheme: IconThemeData(
        color: ColorManager.primary
      ),

      // Text theme
      textTheme: TextTheme(
          headline1: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s30),
          headline2: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s16),
          headline3:
          getSemiBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s16),
          headline4: getBoldStyle(
              color: ColorManager.black, fontSize: FontSize.s14),
          subtitle1: getMediumStyle(
              color: ColorManager.black, fontSize: FontSize.s16),
          subtitle2: getMediumStyle(
              color: ColorManager.primary, fontSize: FontSize.s16),
          headline5: getMediumStyle(
              color: ColorManager.grey2, fontSize: FontSize.s16),
          bodyText2: getMediumStyle(color: ColorManager.lightGrey),
          caption: getRegularStyle(color: ColorManager.grey1),
          bodyText1: getRegularStyle(color: ColorManager.grey) ,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: ColorManager.white ,
        contentTextStyle: getRegularStyle(
            color: ColorManager.black, fontSize: FontSize.s16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s20)
        ),
      ),

      // input decoration theme (text form field)

      inputDecorationTheme: InputDecorationTheme(
        // prefixIcon style
        prefixIconColor: ColorManager.primary,
        // suffixIcon style
        suffixIconColor: ColorManager.primary,

        // content Style
        contentPadding: const EdgeInsets.all(AppPadding.p8),

        // hint style
        hintStyle: getRegularStyle(color: ColorManager.grey1 , fontSize: FontSize.s16),

        // label style
        labelStyle: getMediumStyle(color: ColorManager.black),
        // error style
        errorStyle: getRegularStyle(color: ColorManager.error),

        // enabled border
        enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.lightGrey, width: AppSize.s0_5 ),
          //  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
        ),

        // focused border
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
          //  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
        ),

        // error border
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused error border
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
      ));
}
