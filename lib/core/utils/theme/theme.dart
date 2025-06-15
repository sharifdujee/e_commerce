import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_color.dart';



class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily,
      brightness: Brightness.light,
      primaryColor: AppColor.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      // textTheme: AppTextTheme.lightTextTheme,
      //elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
     // appBarTheme: AppBarThemeData.lightAppBarTheme,
      //inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme);
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: GoogleFonts.smoochSans().fontFamily,
      brightness: Brightness.dark,
      primaryColor: AppColor.primaryColor,
      scaffoldBackgroundColor: Colors.black,
      // textTheme: AppTextTheme.darkTextTheme,
      //elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonTheme,
      //appBarTheme: AppBarThemeData.darkAppBarTheme,
      //inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme);
  );
}