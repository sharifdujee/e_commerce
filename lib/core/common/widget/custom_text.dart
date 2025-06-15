import 'package:flutter/material.dart';


import '../../utils/app_color.dart';


class CustomText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? decorationthickness;
  final TextOverflow? textOverflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final FontStyle? fontStyle;
  final String? fontFamily;


  const CustomText({
    super.key,
    required this.text,
    this.textAlign,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.maxLines,
    this.textOverflow,
    this.decoration,
    this.decorationColor,
    this.decorationthickness,
    this.fontStyle,
    this.fontFamily

  });

  @override
  Widget build(BuildContext context) {
    return Text(

        text,
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
        style: TextStyle(
            fontFamily: fontFamily??'Spring',
            fontSize: fontSize??14,
            fontWeight: fontWeight ?? FontWeight.w600,
            color: color??AppColor.primaryColor,
            decoration: decoration,
            decorationColor: decorationColor??AppColor.textWhite,
            decorationThickness: decorationthickness
        )

    );
  }
}

