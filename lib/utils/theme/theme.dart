import 'package:e_commerce_app/utils/theme/appbar_theme.dart';
import 'package:e_commerce_app/utils/theme/bottomSheet_theme.dart';
import 'package:e_commerce_app/utils/theme/checkbox_theme.dart';
import 'package:e_commerce_app/utils/theme/chip_theme.dart';
import 'package:e_commerce_app/utils/theme/elevatedButtonTheme.dart';
import 'package:e_commerce_app/utils/theme/outlineButton_theme.dart';
import 'package:e_commerce_app/utils/theme/textField_theme.dart';
import 'package:e_commerce_app/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';
 /// change later the nane of the class
class TAppTheme{
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme:TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: ECommerceAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheet,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    inputDecorationTheme: TTextFieldTheme.lightTextFieldTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme:TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: ECommerceAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheet,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    inputDecorationTheme: TTextFieldTheme.darkTextFieldTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme
  );

}