import 'package:flutter/material.dart';

import 'curvededge.dart';

class TCurveEdgeWidget extends StatelessWidget {
  final Widget? child;
  const TCurveEdgeWidget({
    super.key,
    this.child
  });

  @override
  Widget build(BuildContext context) {

    return ClipPath(
      clipper: TCustomCurveEdge(),
      child: child,
    );
  }
}