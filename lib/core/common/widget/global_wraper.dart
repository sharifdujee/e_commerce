import 'package:flutter/material.dart';
import 'package:business_app/core/utils/constants/app_sizer.dart';

class GlobalAppWrapper extends StatelessWidget {
  final Widget child;
  const GlobalAppWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeUtils.setScreenSize(constraints, orientation, context);
            return child;
          },
        );
      },
    );
  }
}
