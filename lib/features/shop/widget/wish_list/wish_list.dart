import 'package:e_commerce_app/common/layout/grid_layout.dart';
import 'package:e_commerce_app/common/widget/appbar/appbar.dart';
import 'package:e_commerce_app/common/widget/icon/t_cicular_icon.dart';
import 'package:e_commerce_app/features/shop/controller/favouritesController.dart';
import 'package:e_commerce_app/features/shop/home/widget/home_screen.dart';
import 'package:e_commerce_app/navigation_menu.dart';
import 'package:e_commerce_app/utils/constants/sizes.dart';
import 'package:e_commerce_app/utils/helpers/animationLoader.dart';
import 'package:e_commerce_app/utils/helpers/cloud_helper.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../common/widget/product-cart/widget/product_card_vertical.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/helpers/shimmer/vertical_product_shimmer.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Obx(()=> FutureBuilder(
                future: controller.favouriteProducts(),
                builder: (context, snapshot) {
                  final emptyWishList = TAnimationLoaderWidget(
                    text: 'Whoops Wishlist is empty',
                    animation: TImages.pencilAnimation,
                    showAction: true,
                    actionText: "Let's add some",
                    onActionPressed: () => Get.off(() => const NavigationMenu()),
                  );
                  const loader = TVerticalCardShimmer(
                    itemCount: 6,
                  );
                  final widget = TCloudHelperFunction.checkMultiRecord(
                      snapShot: snapshot, loader: loader);
                  if (widget != null) return widget;
                  final products = snapshot.data!;
                  return TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) => TProductCardVertical(
                            product: products[index],
                          ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
