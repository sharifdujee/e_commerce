import 'package:e_commerce_admin_panel/common/shimmer/shimmer_effect.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/controller/login_controller.dart';
import 'package:e_commerce_admin_panel/features/feature_authentication/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/devices_utils.dart';
import '../../../enum.dart';
import '../../../rounded_image.dart';

class TAppHeader extends StatelessWidget implements PreferredSizeWidget {
  const TAppHeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Container(
      decoration: const BoxDecoration(
          color: TColors.white,
          border: Border(bottom: BorderSide(color: TColors.grey, width: 1))),
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.md, vertical: TSizes.sm),
      child: AppBar(
        /// icon button
        leading: !TDeviceUtils.isDesktopScreen(context)
            ? IconButton(
                onPressed: () => scaffoldKey!.currentState?.openDrawer(),
                icon: const Icon(Iconsax.menu),
              )
            : null,

        /// search Field
        title: TDeviceUtils.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      hintText: 'Search anything'),
                ),
              )
            : null,

        /// action button
        actions: [
          if (!TDeviceUtils.isDesktopScreen(context))
            IconButton(
                onPressed: () {}, icon: const Icon(Iconsax.search_normal)),
          IconButton(onPressed: () {}, icon: const Icon(Iconsax.notification)),
          const SizedBox(
            height: TSizes.spaceBtwItem / 2,
          ),

          /// user Data
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(

                () => TRoundedImage(

                  imageType: controller.user.value.profilePicture.isNotEmpty
                      ? ImageType.network
                      : ImageType.assets,
                  image: controller.user.value.profilePicture.isNotEmpty
                      ? controller.user.value.profilePicture
                      : TImages.user,
                  width: 40,
                  height: 40,
                  padding: TSizes.sm
                ),
              ),
              const SizedBox(
                width: TSizes.sm,
              ),
              if (!TDeviceUtils.isMobileScreen(context))
                Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.loading.value?
                          const TShimmerEffect(width: 50, height: 13):
                      Text(
                        controller.user.value.fullName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      controller.loading.value?
                      const TShimmerEffect(width: 50, height: 13):
                      Text(
                        controller.user.value.email,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtils.getAppbarHeight() + 15);
}
