import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/common/widget/product-cart/widget/favourite_icon.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/features/shop/controller/images_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widget/appbar/appbar.dart';
import '../../../../../common/widget/custom_shape/curved_edge/curveedge_widget.dart';
import '../../../../../common/widget/icon/t_cicular_icon.dart';
import '../../../../../common/widget/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';
import 'package:get/get.dart';
class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key, required this.product,

  });
  final ProductModel product;



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductsImage(product);
    final dark = THelperFunction.isDarkMode(context);
    return TCurveEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.white,
        child: Stack(
          children: [
             SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                    child: Obx((){
                      final image = controller.selectedProductImage.value;
                      //print('The image url is $image');
                      return GestureDetector(
                        onTap: ()=>controller.showEnlargedImage(image),
                          child: CachedNetworkImage(imageUrl: image, progressIndicatorBuilder: (_, __, downloadProgress)=>CircularProgressIndicator(value: downloadProgress.progress,color: TColors.primaryColor,),));
                    }
                    )),
              ),
            ),

            /// image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBtwItem,
                  ),
                  itemCount: images.length,
                  itemBuilder: (_, index) => Obx((){
                    final imageSelected = controller.selectedProductImage.value == images[index];

                    return TRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        onPressed: ()=> controller.selectedProductImage.value = images[index],
                        border: Border.all(color: imageSelected ? TColors.primaryColor: Colors.transparent),
                        padding:   const EdgeInsets.all(TSizes.sm),
                        imageUrl: images[index]);
                  }
                  ),
                ),
              ),
            ),

            /// appbar icon
             TAppBar(
              showBackArrow: true,
              actions: [
                FavouriteIcon(productId: product.id,)
              ],

            )
          ],
        ),
      ),
    );
  }
}