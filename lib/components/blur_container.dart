import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    super.key,
    required this.text,
    this.height = 40,
    this.width = 40,
    this.fontSize = 18,
  });

  final String text;
  final double height, width, fontSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(defaultBorderRadius / 2),
      ),

      /// BackdropFilter of : sign
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),

        /// Container for displaying the time counter
        child: Container(
          height: height,
          width: width,
          color: Colors.white12,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}