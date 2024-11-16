import 'package:flutter/material.dart';

import '../../screen/app.dart';
import '../../utils/constants/sizes.dart';

class TResponsiveWidget extends StatelessWidget {
  const TResponsiveWidget({
    super.key, required this.desktop, required this.tablet, required this.mobile,
  });
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints){
      if(constraints.maxWidth >= TSizes.desktopSize){
        return desktop;
      }
      else if(constraints.maxWidth < TSizes.desktopSize && constraints.maxWidth >= TSizes.tabletSize){
        return tablet;
      }
      else{
        return mobile;

      }

    });
  }
}