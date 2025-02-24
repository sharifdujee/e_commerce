import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TChipTheme{
  TChipTheme._();
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: TColors.primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
    checkmarkColor: TColors.white

  );
  static ChipThemeData darkChipTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.white),
      selectedColor: TColors.primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      checkmarkColor: TColors.white

  );
}