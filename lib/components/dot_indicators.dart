import 'package:flutter/material.dart';

import '../constants.dart';

class DotIndicators extends StatelessWidget {
  final bool isActive;
  final Color? inActiveColor;
  final Color activeColor;
  const DotIndicators(
      {super.key,
      this.isActive = false,
      this.inActiveColor,
      this.activeColor = primaryColor});

  @override
  Widget build(BuildContext context) {
    /// animated dot
    return AnimatedContainer(
      duration: defaultDuration,
      //padding: const EdgeInsets.symmetric(horizontal: 200),
      height: isActive ? 12 : 4,
      width: 4,
      //curve: Curves.bounceInOut,
      decoration: BoxDecoration(
        color: isActive
            ? activeColor
            : inActiveColor ?? primaryMaterialColor.shade100,
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
    );

    /// end animated dot
  }
}
