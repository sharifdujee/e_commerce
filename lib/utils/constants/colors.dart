

import 'package:flutter/material.dart';

class TColors{
  TColors._();
  /// Base color
  static const Color primaryColor = Color(0xFF4B68FF);
  static const secondaryColor = Color(0xFFFFE24B);
  static const accentColor = Color(0xFFb0c7ff);

  /// Gradient Color
  static const Gradient linearGradient = LinearGradient(colors: [
    Color(0xFFFF9a9a),
    Color(0xFFfad0c4),
    Color(0xFFfad0c4),

  ],
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707)
  );


  /// Text Color
 static const Color textPrimary = Color(0xFF333333);
 static const Color textSecondary = Color(0xFF6C757D);
 static const Color textWhite = Colors.white;

 /// background color

 static const Color light = Color(0xFFF6F6F6);
 static const Color dark = Color(0xFF272727);
 static const Color primaryBackground = Color(0xFFF3F5FF);

 /// Container Color

  static const Color lightContainer = Color(0xFFF6F6F6);
  static  Color darkContainer = TColors.white.withOpacity(0.1);

  /// border Color

   static const Color borderPrimary = Color(0xFFD9D9D9);
   static const Color borderSecondary = Color(0xFFE6E6E6);

   /// error and validation color
   static const Color error = Color(0xFFD32F2F);
   static const Color success = Color(0xFF388E3C);
   static const Color warning = Color(0xFFF57C00);
   static const Color info = Color(0xFF1976D2);

   /// neutral Color
   static const Color black = Color(0xFF232323);
   static const Color darkerGrey = Color(0xFF4F4F4F);
   static const Color darkGrey = Color(0xFF939393);
   static const Color grey = Color(0xFFE0E0E0);
   static const Color softGrey = Color(0xFFF4F4F4);
   static const lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);



}