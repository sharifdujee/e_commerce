import 'package:e_commerce_admin_panel/common/rounded_container.dart';
import 'package:e_commerce_admin_panel/common/rounded_image.dart';
import 'package:e_commerce_admin_panel/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/enum.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images_strings.dart';
import '../../controller/media_controller.dart';
import 'folder_dropdown.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return  TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: TSizes.spaceBtwSections,),
          Row(
            children: [
              ///Folders Drop down
              Text(
                'Select Folder',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItem,
              ),
              MediaFolderDropdown(
                onChanged: (MediaCategory? newValue) {
                  if (newValue != null) {
                    controller.selectedPath.value = newValue;
                  }
                },
              ),
              const SizedBox(height: TSizes.spaceBtwSections,),
              ///display Media
              Wrap(
                alignment: WrapAlignment.start,
                spacing: TSizes.spaceBtwItem / 2,
                runSpacing: TSizes.spaceBtwItem / 2,
                children: [
                  TRoundedImage(
                    width: 90,
                    height: 90,
                    padding: TSizes.sm,
                    imageType: ImageType.assets,
                    image: TImages.google,
                    //memoryImage: element.localImageTODisplay,
                    backgroundColor: TColors.primaryBackground,
                  ),
                  TRoundedImage(
                    width: 90,
                    height: 90,
                    padding: TSizes.sm,
                    imageType: ImageType.assets,
                    image: TImages.google,
                    //memoryImage: element.localImageTODisplay,
                    backgroundColor: TColors.primaryBackground,
                  ),
                  TRoundedImage(
                    width: 90,
                    height: 90,
                    padding: TSizes.sm,
                    imageType: ImageType.assets,
                    image: TImages.google,
                    //memoryImage: element.localImageTODisplay,
                    backgroundColor: TColors.primaryBackground,
                  ),
                  TRoundedImage(
                    width: 90,
                    height: 90,
                    padding: TSizes.sm,
                    imageType: ImageType.assets,
                    image: TImages.google,
                    //memoryImage: element.localImageTODisplay,
                    backgroundColor: TColors.primaryBackground,
                  ),
                  TRoundedImage(
                    width: 90,
                    height: 90,
                    padding: TSizes.sm,
                    imageType: ImageType.assets,
                    image: TImages.google,
                    //memoryImage: element.localImageTODisplay,
                    backgroundColor: TColors.primaryBackground,
                  ),
                  TRoundedImage(
                    width: 90,
                    height: 90,
                    padding: TSizes.sm,
                    imageType: ImageType.assets,
                    image: TImages.google,
                    //memoryImage: element.localImageTODisplay,
                    backgroundColor: TColors.primaryBackground,
                  ),
                  TRoundedImage(
                    width: 90,
                    height: 90,
                    padding: TSizes.sm,
                    imageType: ImageType.assets,
                    image: TImages.google,
                    //memoryImage: element.localImageTODisplay,
                    backgroundColor: TColors.primaryBackground,
                  ),
                ],
              ),



            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: TSizes.buttonWidth,
                  child: ElevatedButton.icon(onPressed: (){}, label: const Text('Load More'), icon: const Icon(Iconsax.arrow_down),),
                )
              ],
            ),)

        ],
      ),
    );
  }
}
