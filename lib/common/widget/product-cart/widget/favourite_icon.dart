import 'package:e_commerce_app/common/widget/icon/t_cicular_icon.dart';
import 'package:e_commerce_app/features/shop/controller/favouritesController.dart';
import 'package:e_commerce_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() => TCircularIcon(
          icon: controller.isFavourite(productId)
              ? Iconsax.heart5
              : Iconsax.heart,
      color: controller.isFavourite(productId)?TColors.error:null,
      onPressed: ()=>controller.toggleFavoriteProducts(productId),
        ));
  }
}
