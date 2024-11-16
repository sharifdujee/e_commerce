import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;
  final EdgeInsets? margin;
  const TCircularContainer({
    super.key, this.height = 400, this.width =400,  this.radius =400,  this.padding = 0, this.child, this.backgroundColor = TColors.white, this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: height,
      height: width,
      padding: EdgeInsets.all(padding),
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: backgroundColor
      ),
      child: child,
    );
  }
}