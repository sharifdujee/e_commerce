import 'package:e_commerce_app/common/layout/grid_layout.dart';
import 'package:e_commerce_app/utils/helpers/shimmer/simmer_effect.dart';

import 'package:flutter/cupertino.dart';

class BrandShimmerEffect extends StatelessWidget {
  const BrandShimmerEffect({super.key, this.itemCount = 4});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (_, __) => const TShimmerEffect(width: 300, height: 80),
    );
  }
}
