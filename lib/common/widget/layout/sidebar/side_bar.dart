import 'package:e_commerce_admin_panel/common/circular_image.dart';
import 'package:e_commerce_admin_panel/utils/constants/colors.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../routes/routes.dart';
import '../../../../utils/constants/images_strings.dart';
import 'menu_item.dart';

class TSideBar extends StatelessWidget {
  const TSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: const BoxDecoration(
            color: TColors.white,
            border: Border(right: BorderSide(color: TColors.grey))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///Image
              const TCircularImage(image: TImages.darkAppLogo, width: 100,height: 100, backgroundColor: Colors.transparent,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('MENU', style: Theme.of(context).textTheme.bodySmall!.apply(
                      letterSpacingDelta: 1.2
                    ),),
                    /// Main Item
                     const TMenuItem(icon: Iconsax.status,
                     itemName: 'DashBoard',
                     route: TRoutes.loginScreen,),
                    const TMenuItem(icon: Iconsax.image,
                      itemName: 'Media',
                      route: TRoutes.media,),
                    const TMenuItem(icon: Iconsax.picture_frame,
                      itemName: 'Banners',
                      route: TRoutes.resetPassword,),

                  ],

                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}


