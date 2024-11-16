import 'package:e_commerce_app/common/widget/brands/brand_show_case.dart';
import 'package:e_commerce_app/features/shop/controller/brand_controller.dart';
import 'package:e_commerce_app/features/shop/model/category_model.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/shimmer/tbox_shimmer.dart';
import '../../../../utils/helpers/shimmer/tlist_shimmer.dart';

class CategoryBrand extends StatelessWidget {
  const CategoryBrand({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        const loader = Column(
          children: [
            TListShimmerEffect(),
            SizedBox(
              height: TSizes.defaultSpace,
            ),
            TBoxShimmerEffect(),
            SizedBox(
              height: TSizes.defaultSpace,
            ),
          ],
        );

        final widget = TCloudHelperFunction.checkMultiRecord(
            snapShot: snapshot, loader: loader);
        if (widget != null) return widget;

        if (!snapshot.hasData) return loader;

        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (_, index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                final widget = TCloudHelperFunction.checkMultiRecord(
                    snapShot: snapshot, loader: loader);
                if (widget != null) return widget;

                if (!snapshot.hasData) return loader;

                final products = snapshot.data!;
                return TBrandShowCase(
                  images: products.map((e) => e.thumbnail).toList(),
                  brand: brand,
                );
              },
            );
          },
        );
      },
    );
  }
}
