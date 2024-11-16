import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

/// Demo Image
const productDemoImage1 = 'https://mainsailorimagebucket.s3.ap-southeast-1.amazonaws.com/uploads/all/IaMbtgCxryDPm9D8XAV7r6FeODtJzQLRViu0KX8V.jpg';
const productDemoImage2 = 'https://i.imgur.com/Kc7zvwk.jpeg';
const productDemoImage3 = 'https://i.imgur.com/J7mGZ12.png';
const productDemoImage4 = 'https://www.aarong.com/media/catalog/category/sbc-Kids_New_Arrivals-puja-29092024.jpg';
const productDemoImage5 = 'https://i0.wp.com/www.nogorpolli.com/wp-content/uploads/2018/12/list-of-top-15-fashion-or-clothing-brands-house-in-bangladesh-richman-dorjibari-%E0%A6%A8%E0%A6%97%E0%A6%B0-%E0%A6%AA%E0%A6%B2%E0%A7%8D%E0%A6%B2%E0%A7%80-nogor-polli-apparel-clothing-fashion-store.png?resize=750%2C500&ssl=1';
const productDemoImage6 = 'https://i.imgur.com/JfyZlnO.png';

/// end of the demo image
const grandisExtendedFont = "Grandis Extended";

// On color 80, 60.... those means opacity

/// primary color
const Color primaryColor = Color(0xFF80f1ec);

/// Material Color Variant
const MaterialColor primaryMaterialColor =
    MaterialColor(0xFF92ff71, <int, Color>{
  50: Color(0xFFEFECFF),
  100: Color(0xFFD7D0FF),
  200: Color(0xFFBDB0FF),
  300: Color(0xFFA390FF),
  400: Color(0xFF8F79FF),
  500: Color(0xFF7B61FF),
  600: Color(0xFF7359FF),
  700: Color(0xFF684FFF),
  800: Color(0xFF5E45FF),
  900: Color(0xFF6C56DD),
});

/// end of the material color

/// Color
const Color blackColor = Color(0xFF2c2127);
const Color blackColor80 = Color(0xFF45454B);
const Color blackColor60 = Color(0xFF737378);
const Color blackColor40 = Color(0xFFA2A2A5);
const Color blackColor20 = Color(0xFFD0D0D2);
const Color blackColor10 = Color(0xFFE8E8E9);
const Color blackColor5 = Color(0xFFF3F3F4);
const Color whiteColor = Colors.white;
const Color whileColor80 = Color(0xFFCCCCCC);
const Color whileColor60 = Color(0xFF999999);
const Color whileColor40 = Color(0xFF666666);
const Color whileColor20 = Color(0xFF333333);
const Color whileColor10 = Color(0xFF191919);
const Color whileColor5 = Color(0xFF0D0D0D);
const Color greyColor = Color(0xFFB8B5C3);
const Color lightGreyColor = Color(0xFFF8F8F9);
const Color darkGreyColor = Color(0xFF1C1C25);
const Color purpleColor = Color(0xFF7B61FF);
const Color successColor = Color(0xFF2ED573);
const Color warningColor = Color(0xFFFFBE21);
const Color errorColor = Color(0xFFEA5B5B);

/// end of the custom color section

/// padding , borderRadius, duration
const double defaultPadding = 15.0;
const double defaultBorderRadius = 14.0;
const Duration defaultDuration = Duration(milliseconds: 500);

/// end of the section

/// password validation expression
final passwordValidatorExpression = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(8, errorText: 'Password must be at least 8 characters long'),
  PatternValidator(r'[#?!@$%^&*-]', errorText: 'Password must have at least one special character'),
]);


/// end password validator

/// email validator
final emailValidatorExpression = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  EmailValidator(errorText: 'Enter a valid email'),
  PatternValidator(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
      errorText: 'follow the standard email format')
]);

/// end of email validator

const pasNotMatchErrorText = "passwords do not match";
