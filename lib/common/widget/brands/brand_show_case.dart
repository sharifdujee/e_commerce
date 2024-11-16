import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/features/personalization/model/product/brandModel.dart';
import 'package:e_commerce_app/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce_app/utils/helpers/shimmer/simmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shape/containers/rounded_container.dart';
import 'brand_card.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images,
    required this.brand
  });
  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.to(()=>BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin:
        const EdgeInsets.only(bottom: TSizes.spaceBtwItem),
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          children: [
            TBrandCard(
              brand: brand,
              showBorder: true,
              onTap: () {},
            ),
            const SizedBox(
              height: TSizes.spaceBtwItem,
            ),
            Row(
                children:
                images.map((image) => brandTopProductImageWidget(image, context)).toList()

            )

            /// brand with product count
          ],
        ),
      ),
    );
  }

  /// product
  Widget brandTopProductImageWidget(String image, context){
    return Expanded(child: TRoundedContainer(
      height: 100,
      backgroundColor:
      THelperFunction.isDarkMode(context)
          ? TColors.darkGrey
          : TColors.light,
      margin: const EdgeInsets.only(right: TSizes.sm),
      child: CachedNetworkImage(imageUrl: image,
        fit: BoxFit.contain,
        progressIndicatorBuilder: (context, url, downloadProgress)=>const TShimmerEffect(width: 100, height: 100),
        errorWidget: (context, url, error)=> const Icon(Icons.error),
      ),
       ),
    );
  }
}