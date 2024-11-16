import 'package:e_commerce_app/common/widget/icon/t_cicular_icon.dart';
import 'package:e_commerce_app/features/personalization/controller/cart_controller/cart_controller.dart';
import 'package:e_commerce_app/features/personalization/model/product/product_model.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace /2, horizontal: TSizes.defaultSpace),
      decoration: BoxDecoration(
        color: dark? TColors.darkerGrey: TColors.light,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(TSizes.cardRadiusLg),
        topRight: Radius.circular(TSizes.cardRadiusLg))
      ),
      child: Obx(()=>Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                   TCircularIcon(icon: Iconsax.minus,
                  height: 40,
                  width: 40,
                  backgroundColor: TColors.darkGrey,
                  color: TColors.white,
                    onPressed:()=> controller.productQuantityInCart.value<1 ? null: controller.productQuantityInCart.value -=1,
                  ),
                  const SizedBox(width: TSizes.spaceBtwItem,),
                  Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall,),
                  const SizedBox(width: TSizes.spaceBtwItem,),
                   TCircularIcon(icon: Iconsax.add,
                    height: 40,
                    width: 40,
                    backgroundColor: TColors.black,
                    color: TColors.white,
                     onPressed:()=> controller.productQuantityInCart.value +=1,
                  ),

                ],
              ),

            ElevatedButton(onPressed: controller.productQuantityInCart.value<1? null:()=>controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: TColors.black,
                  side: const BorderSide(color: TColors.black),
                ),
                child: const Text('Add to Cart'))
          ],

            ),
      )
    );
  }
}
