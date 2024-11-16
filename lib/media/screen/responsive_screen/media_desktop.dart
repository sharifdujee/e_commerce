import 'package:e_commerce_admin_panel/common/breadCrumbs/breadCrumb_with_heading.dart';
import 'package:e_commerce_admin_panel/media/controller/media_controller.dart';
import 'package:e_commerce_admin_panel/media/screen/responsive_screen/media_content.dart';
import 'package:e_commerce_admin_panel/media/screen/responsive_screen/media_uploader.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';

class MediaDesktop extends StatelessWidget {
  const MediaDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TBreadcrumbsWithHeading(heading: 'Media', breadcrumbItems: [TRoutes.loginScreen, 'Media Screen', ],returnToPreviousScreen: true,),
                SizedBox(
                  width: TSizes.buttonWidth * 1.5,
                    child: ElevatedButton.icon(onPressed: ()=> controller.shoeImageUploaderSection.value = !controller.shoeImageUploaderSection.value, label: const Text('Upload Image'), icon: const Icon(Iconsax.cloud_add),))
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            /// Upload Area
            const MediaUploader(),
            ///Media
            const MediaContent(),

            ///
          ],
        ),),
      ),
    );
  }
}
