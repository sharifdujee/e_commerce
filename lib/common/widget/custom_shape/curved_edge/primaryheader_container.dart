import 'package:e_commerce_app/common/widget/custom_shape/containers/circular_containner.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import 'curveedge_widget.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  final Widget child;
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TCurveEdgeWidget(
      child: Container(

        color: TColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(top: -150, right: -250,child: CircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),),),
            Positioned(top: 100, right: -300,child: CircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1),),),
            child
          ],
        ),
      ),
    );
  }
}